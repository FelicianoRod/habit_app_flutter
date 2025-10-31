import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_app/core/providers/habits_provider.dart';
import 'package:habits_app/theme/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/models/habit.dart';

class HomeTab extends ConsumerWidget {
  DateTime selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String selectedPeriod = 'All Day';
  final periods = ['All Day', 'Morning', 'Evening', 'Afternoon'];

  HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),

      // backgroundColor: const Color(0xFF0E0E10),
      // body: _buildContent(context, ref, habitsList),

      // Si quieres volver a usar Riverpod, descomenta y adapta este bloque:
      body: habitsAsync.when(
        data: (habits) => _buildContent(context, ref, habits ?? []),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    List<Habit> habits,
  ) {
    // final sorted = ref
    //     .read(filteredHabitsProvider.notifier)
    //     .getSortedByPriority(habits);
    final sortedAsync = ref.watch(filteredHabitsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          // const SizedBox(height: 8),
          const SizedBox(height: 16),
          _buildPeriodSelector(),
          // const SizedBox(height: 16),
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
    // Reemplazo con TableCalendar para mayor control
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.surfaceContainer,
        color: Theme.of(context).colorScheme.surfaceContainer,
        // color: Color(0xFF121214),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(24),
        //   bottomRight: Radius.circular(24),
        // ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadiusL),
        ),
      ),
      // Limitar la altura para que el calendario ocupe una sola fila visual (vista semanal).
      child: SizedBox(
        // height: 140, // ajusta este valor si quieres más/menos espacio
        child: TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          headerVisible: false,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.week, // forzar vista semanal
          availableCalendarFormats: const {
            CalendarFormat.week: 'Semana',
          }, // evitar cambiar formato
          selectedDayPredicate: (day) => isSameDate(day, selectedDate),
          onDaySelected: (selectedDay, focusedDay) {
            // setState(() {
            //   selectedDate = selectedDay;
            //   _focusedDay = focusedDay;
            // });    // TODO: notificar al viewmodel si necesitas recargar datos por fecha
          },
          // headerStyle: HeaderStyle(
          //   // Hacemos invisible el título del mes (lo ocultamos visualmente).
          //   // titleTextStyle: const TextStyle(
          //   //   color: Colors.transparent,
          //   //   fontSize: 0,
          //   // ),
          //   formatButtonVisible: false,
          //   titleCentered: true,
          //   leftChevronIcon: const Icon(
          //     Icons.chevron_left,
          //     color: Colors.white70,
          //   ),
          //   rightChevronIcon: const Icon(
          //     Icons.chevron_right,
          //     color: Colors.white70,
          //   ),
          //   headerPadding: const EdgeInsets.symmetric(
          //     vertical: 4,
          //   ), // menos espacio arriba
          // ),
          daysOfWeekStyle: DaysOfWeekStyle(
            // weekdayStyle: TextStyle(color: Colors.white54),
            // weekendStyle: TextStyle(color: Colors.white54),
            weekdayStyle: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
            weekendStyle: TextStyle(
              fontStyle: Theme.of(context).textTheme.bodyMedium!.fontStyle,
              color: Colors.red,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black),
            weekendTextStyle: TextStyle(color: Colors.black),
            // defaultTextStyle: TextStyle(color: Colors.white),
            // weekendTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Color(0xFF2A2A2E),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              // color: Colors.white,
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
          // return Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainer, // Fondo sutil
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
                    // onTap: () => setState(() => selectedPeriod = p),
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
                        // color: selected
                        //     ? const Color(0xFF2A2A2E)
                        //     : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _filterName(m.name),
                        style: Theme.of(context).textTheme.bodyMedium,
                        // style: TextStyle(
                        //   color: selected ? Colors.white : Colors.white54,
                        //   fontSize: 14,
                        // ),
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

  Widget _buildHabitCard(BuildContext context, WidgetRef ref, Habit habit) {
    final iconData = _guessIconForHabit(habit);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: const Color(0xFF1A1A1C),
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // CircleAvatar(
          //   radius: 26,
          //   backgroundColor: _getPriorityColor(
          //     habit.priority,
          //   ).withOpacity(0.15),
          //   child: Icon(iconData, color: _getPriorityColor(habit.priority)),
          // ),
          GestureDetector(
            // onTap: _pickIcon,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Color(int.parse("0xFF${habit.icon.backgroundColor}")),
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
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
                  // style: const TextStyle(
                  //   color: Theme.of(context).textTheme.bodyLarge.color,
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.w600,
                  // ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('🔥'),
                    // const Icon(Icons.star, size: 12, color: Colors.amber),
                    const SizedBox(width: 6),
                    Text(
                      'Racha',
                      style: Theme.of(context).textTheme.bodySmall,
                      // style: const TextStyle(
                      //   color: Colors.white70,
                      //   fontSize: 12,
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _measureProgressLabel(habit),
                style: Theme.of(context).textTheme.bodyMedium,
                // style: TextStyle(
                //   // color: _getMeasureColor(habit),
                //   fontSize: 14,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              const SizedBox(height: 6),
              Text(
                _measureUnitLabel(habit),
                // style: const TextStyle(color: Colors.white54, fontSize: 12),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            color: Colors.greenAccent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String _measureProgressLabel(Habit habit) {
    return habit.measure.map(
      quantity: (q) {
        return '0/${q.amount}';
      },
      time: (t) {
        return '${t.timeInMinutes}m';
      },
      repetitions: (r) {
        return '0/${r.count}';
      },
    );
  }

  String _measureUnitLabel(Habit habit) {
    return habit.measure.map(
      quantity: (q) =>
          (q.description?.isNotEmpty ?? false) ? q.description! : 'units',
      time: (t) => 'time',
      repetitions: (r) =>
          (r.description?.isNotEmpty ?? false) ? r.description! : 'times',
    );
  }

  // Color _getMeasureColor(Habit habit) {
  //   return _getPriorityColor(habit.priority);
  // }

  IconData _guessIconForHabit(Habit habit) {
    final lower = habit.name.toLowerCase();
    if (lower.contains('water')) return Icons.water_drop;
    if (lower.contains('exercise') ||
        lower.contains('run') ||
        lower.contains('walk'))
      return Icons.fitness_center;
    if (lower.contains('brush') ||
        lower.contains('floss') ||
        lower.contains('teeth'))
      return Icons.health_and_safety;
    if (lower.contains('read') ||
        lower.contains('book') ||
        lower.contains('pages'))
      return Icons.menu_book;
    return Icons.star_border;
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

  // Color _getPriorityColor(Priority priority) {
  //   switch (priority) {
  //     case Priority.high:
  //       return Colors.redAccent;
  //     case Priority.medium:
  //       return Colors.orangeAccent;
  //     case Priority.low:
  //       return Colors.greenAccent;
  //   }
  // }
}

// bool isSameDate(DateTime a, DateTime b) =>
//     a.year == b.year && a.month == b.month && a.day == b.day;
//   }
// }
//   Color _getPriorityColor(Priority priority) {
//     switch (priority) {
//       case Priority.high:
//         return Colors.redAccent;
//       case Priority.medium:
//         return Colors.orangeAccent;
//       case Priority.low:
//         return Colors.greenAccent;
//     }
//   }
// }
//     return Icons.health_and_safety;
//   if (lower.contains('read') ||
//       lower.contains('book') ||
//       lower.contains('pages'))
//     return Icons.menu_book;
//   return Icons.star_border;
// }

bool isSameDate(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

// Color _getPriorityColor(Priority priority) {
//   switch (priority) {
//     case Priority.high:
//       return Colors.redAccent;
//     case Priority.medium:
//       return Colors.orangeAccent;
//     case Priority.low:
//       return Colors.greenAccent;
//   }
// }

// }
