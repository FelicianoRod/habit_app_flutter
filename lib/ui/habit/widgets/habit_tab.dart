import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_app/core/providers/habits_provider.dart';
import 'package:habits_app/theme/app_constants.dart';
import 'package:habits_app/ui/habit/viewmodel/habit_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/models/habit.dart';

// Reemplazamos ConsumerWidget por StatefulConsumerWidget para manejar _expandedId
class HabitTab extends ConsumerStatefulWidget {
  HabitTab({super.key});

  @override
  ConsumerState<HabitTab> createState() => _HabitTabState();
}

class _HabitTabState extends ConsumerState<HabitTab> {
  DateTime selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String selectedPeriod = 'All Day';
  final periods = ['All Day', 'Morning', 'Evening', 'Afternoon'];

  // estado local para controlar qué item está expandido
  int? _expandedId;

  @override
  Widget build(BuildContext context) {
    final habitsAsync = ref.watch(habitsProvider);
    // final habitsAsync = ref.watch(habitsListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hábitos')),
      body: habitsAsync.when(
        data: (habits) => _buildContent(context, ref, habits ?? []),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.push('/create-habit');
          context.push('/habits/measure');
        },
        tooltip: 'Editar Hábito',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    List<Habit> habits,
  ) {
    final sortedAsync = ref.watch(filteredHabitsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPeriodSelector(),
          sortedAsync.when(
            data: (sorted) {
              return _buildHabitsList(context, ref, sorted);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadiusL),
        ),
      ),
      child: SizedBox(
        child: TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          headerVisible: false,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.week,
          availableCalendarFormats: const {CalendarFormat.week: 'Semana'},
          selectedDayPredicate: (day) => isSameDate(day, selectedDate),
          onDaySelected: (selectedDay, focusedDay) {},
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
            weekendStyle: TextStyle(
              fontStyle: Theme.of(context).textTheme.bodyMedium!.fontStyle,
              color: Colors.red,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black),
            weekendTextStyle: TextStyle(color: Colors.black),
            todayDecoration: BoxDecoration(
              color: Color(0xFF2A2A2E),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: Colors.black),
            outsideDaysVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final isSelected = isSameDate(day, selectedDate);
              return Center(
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final measures = ref.watch(measureValuesProvider);
        final selectedMeasure = ref.watch(habitCurrentFilterProvider);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: measures.map((m) {
                  final selected = m.name == selectedMeasure.name;
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(habitCurrentFilterProvider.notifier)
                          .setCurrentFilter(m);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _filterName(m.name),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHabitsList(
    BuildContext context,
    WidgetRef ref,
    List<Habit> habits,
  ) {
    if (habits.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'No hay hábitos registrados',
            style: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: habits.map((h) => _buildHabitCard(context, ref, h)).toList(),
      ),
    );
  }

  // Modificación principal: eliminamos "Racha" y cambiamos la parte derecha por iconos
  Widget _buildHabitCard(BuildContext context, WidgetRef ref, Habit habit) {
    final isExpanded = _expandedId == habit.id;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse("0xFF${habit.icon.backgroundColor}"),
                    ),
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadiusM,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      IconData(
                        int.parse(habit.icon.icon),
                        fontFamily: 'MaterialIcons',
                      ),
                      color: Color(int.parse('0xFF${habit.icon.iconColor}')),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 6),
                    // "Racha" eliminado; ahora mostramos unidad/descriptor opcional debajo del título
                    Text(
                      _measureUnitLabel(habit),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              // Derecha: icono de editar y icono para desplegar más info
              Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  // delete icon
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirmar eliminación'),
                          content: const Text(
                            '¿Estás seguro de que deseas eliminar este hábito?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Eliminar'),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        ref.read(deleteHabitProvider(habit.id).future);
                        // await ref
                        //     .read(habitRepositoryProvider)
                        //     .delete(habit.id);
                      }
                    },
                    tooltip: 'Eliminar',
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () =>
                        context.push('/habits/edit-habit/${habit.id}'),
                    tooltip: 'Editar',
                  ),
                  IconButton(
                    icon: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        _expandedId = isExpanded ? null : habit.id;
                      });
                    },
                    tooltip: isExpanded ? 'Cerrar detalles' : 'Ver detalles',
                  ),
                ],
              ),
            ],
          ),

          // Panel desplegable con más detalles del hábito (recordatorio, medida, acción)
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingM,
                vertical: AppConstants.spacingS,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                // color: Colors.grey.shade50,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (habit.reminder != null)
                    Row(
                      children: [
                        const Icon(Icons.alarm, size: 18),
                        SizedBox(width: AppConstants.spacingS),
                        Text(
                          'Recordatorio: ${_formatTime(habit.reminder!.time)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  if (habit.reminder != null)
                    SizedBox(height: AppConstants.spacingS),
                  Row(
                    children: [
                      const Icon(Icons.info_outline, size: 18),
                      SizedBox(width: AppConstants.spacingS),
                      Expanded(
                        child: Text(
                          'Medida: ${_measureProgressLabel(habit)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstants.spacingS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () =>
                            context.push('/track-habit/${habit.id}'),
                        icon: const Icon(Icons.add_task),
                        label: const Text('Marcar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  String _measureProgressLabel(Habit habit) {
    return habit.measure.map(
      quantity: (q) => '0/${q.amount}',
      time: (t) => '${t.timeInMinutes}m',
      repetitions: (r) => '0/${r.count}',
    );
  }

  String _measureUnitLabel(Habit habit) {
    return habit.measure.map(
      quantity: (q) =>
          (q.description?.isNotEmpty ?? false) ? q.description! : 'Cantidad',
      time: (t) => 'Tiempo',
      repetitions: (r) => (r.description?.isNotEmpty ?? false)
          ? r.description!
          : 'Repeticiones',
    );
  }

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _filterName(String name) {
    final String filterName;
    if (name == 'all') {
      filterName = 'Todos';
    } else if (name == 'quantity') {
      filterName = 'Cantidad';
    } else if (name == 'time') {
      filterName = 'Tiempo';
    } else if (name == 'repetitions') {
      filterName = 'Repeticiones';
    } else {
      filterName = name;
    }
    return filterName;
  }
}

bool isSameDate(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
