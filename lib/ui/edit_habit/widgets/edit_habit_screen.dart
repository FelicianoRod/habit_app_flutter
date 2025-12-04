import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_app/domain/models/habit.dart';
import 'package:habits_app/ui/edit_habit/viewmodel/edit_habit_viewmodel.dart';

import '../../../theme/app_constants.dart';

class EditHabitScreen extends ConsumerWidget {
  final int habitId;

  const EditHabitScreen({super.key, required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitAsync = ref.watch(getHabitByIdProvider(habitId));

    return habitAsync.when(
      data: (habit) => _EditHabitForm(initialHabit: habit!),
      // TODO
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

class _EditHabitForm extends ConsumerStatefulWidget {
  final Habit initialHabit;
  const _EditHabitForm({super.key, required this.initialHabit});

  @override
  ConsumerState<_EditHabitForm> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends ConsumerState<_EditHabitForm> {
  late final TextEditingController nameController;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  // Measure state
  String _measureType = "Quantity";
  // final Measure? _selectedMeasure = null;
  // late MeasureEnum _measureType;
  final _amountController = TextEditingController();
  final _minutesController = TextEditingController();
  final _repetitionsController = TextEditingController();
  final _measureDescController = TextEditingController();

  // Appearance
  IconData? _selectedIcon;
  Color _iconColor = Colors.blue;
  Color _bgColor = Colors.grey.shade800;

  // Reminder
  bool _reminderEnabled = false;
  // TimeOfDay _reminderTime = TimeOfDay.now();
  TimeOfDay _reminderTime = TimeOfDay.now();

  DateTime _combineTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  String measureToString(Measure measure) {
    String stringMeasure = 'Quantity';
    measure.when(
      quantity: (_, __) {
        stringMeasure = 'Quantity';
      },
      time: (_) {
        stringMeasure = 'Time';
      },
      repetitions: (_, __) {
        stringMeasure = 'Repetitions';
      },
    );
    return stringMeasure;
  }

  Color hexToColor(String hex) {
    // Si viene sin el prefijo #
    hex = hex.replaceAll('#', '');
    // Añadimos FF si no incluye canal alfa
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialHabit.name);
    _measureType = measureToString(widget.initialHabit.measure);

    widget.initialHabit.measure.when(
      quantity: (amount, description) {
        _amountController.text = amount.toString();
        _measureDescController.text = description ?? '';
      },
      time: (timeInMinutes) {
        _minutesController.text = timeInMinutes.toString();
      },
      repetitions: (count, description) {
        _repetitionsController.text = count.toString();
        _measureDescController.text = description ?? '';
      },
    );

    _selectedIcon = IconData(
      int.parse(widget.initialHabit.icon.icon),
      fontFamily: 'materialIcons',
    );
    _iconColor = hexToColor(widget.initialHabit.icon.iconColor);
    _bgColor = hexToColor(widget.initialHabit.icon.backgroundColor);

    _reminderEnabled = widget.initialHabit.reminder != null ? true : false;
    if (_reminderEnabled) {
      final reminder = widget.initialHabit.reminder!.time;

      _reminderTime = TimeOfDay(hour: reminder.hour, minute: reminder.minute);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _minutesController.dispose();
    _repetitionsController.dispose();
    _measureDescController.dispose();
    super.dispose();
  }

  Future<void> _pickIcon() async {
    // flutter_iconpicker: shows a picker and returns IconData?
    // final IconData? icon = await FlutterIconPicker.showIconPicker(
    final IconPickerIcon? icon = await showIconPicker(
      context,
      // optional: limit packs if you want
    );
    if (icon != null) {
      setState(() {
        _selectedIcon = icon.data;
      });
    }
  }

  Future<void> _pickColor({required bool forBackground}) async {
    Color picked = forBackground ? _bgColor : _iconColor;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Pick color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: picked,
            onColorChanged: (c) => picked = c,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (forBackground)
                  _bgColor = picked;
                else
                  _iconColor = picked;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickTime() async {
    final TimeOfDay? res = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (res != null) {
      setState(() {
        _reminderTime = res;
      });
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    // Minimal save action: print values. Integrate with your domain logic.
    // final payload = {
    //   'name': _nameController.text,
    //   'measureType': _measureType,
    //   'amount': _amountController.text,
    //   'minutes': _minutesController.text,
    //   'repetitions': _repetitionsController.text,
    //   'measureDesc': _measureDescController.text,
    //   'icon': _selectedIcon?.codePoint,
    //   'iconColor': _iconColor.value,
    //   'bgColor': _bgColor.value,
    //   'reminderEnabled': _reminderEnabled,
    //   'reminderTime': '${_reminderTime.hour}:${_reminderTime.minute}',
    // };
    // ...hook into your Bloc/Provider/Repository...

    // Aquí
    final updateHabit = ref
        .read(updateHabitProvider.notifier)
        .updateHabit(
          id: widget.initialHabit.id,
          name: nameController.text,
          measure: _measureType == 'Quantity'
              ? Measure.quantity(
                  amount: int.parse(_amountController.text),
                  description: _measureDescController.text.isNotEmpty
                      ? _measureDescController.text
                      : null,
                )
              : _measureType == 'Time'
              ? Measure.time(timeInMinutes: int.parse(_minutesController.text))
              : Measure.repetitions(
                  count: int.parse(_repetitionsController.text),
                  description: _measureDescController.text.isNotEmpty
                      ? _measureDescController.text
                      : null,
                ),
          reminder: _reminderEnabled
              ? Reminder(time: _combineTimeOfDay(_reminderTime))
              : null,
          icon: CustomIcon(
            icon: _selectedIcon != null
                ? '0x${_selectedIcon!.codePoint.toRadixString(16)}'
                : '0xe3af', // default icon code
            iconColor: _iconColor.value.toRadixString(16).toUpperCase(),
            backgroundColor: _bgColor.value.toRadixString(16).toUpperCase(),
          ),
        );
    // final createHabit = ref.read(createHabitProvider.notifier).createHabit();

    // debugPrint('Saving habit: $payload');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Hábito guardado')));
    context.pop();
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM,
        vertical: AppConstants.spacingS,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppConstants.fontSizeLarge,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM,
        vertical: AppConstants.spacingS,
      ),
      padding: const EdgeInsets.all(AppConstants.spacingM),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
        // boxShadow: AppConstants.cardShadow,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final habit = ref.watch(getHabitByIdProvider(widget.habitId));
    // final selectedMeasure = ref.watch(selectedMeasureProvider);
    // final habit = ref.watch(editHabitProvider(widget.initialHabit));
    // final notifier = ref.read(editHabitProvider(widget.initialHabit).notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar hábito'), elevation: 0),
      // body: habit.when(
      //   data: (habit) {
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            // General section
            SliverToBoxAdapter(child: _sectionHeader('General')),
            SliverToBoxAdapter(
              child: _card(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      // onChanged: (value) => notifier.updateName,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ej: Beber agua',
                        // prefixIcon: Icon(
                        //   Icons.run_circle_outlined,
                        //   color: Theme.of(context).colorScheme.primary,
                        // ),
                      ),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    const SizedBox(height: AppConstants.spacingM),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            // value: _measureType,
                            hint: const Text('Selecciona la medida'),
                            items: const [
                              DropdownMenuItem(
                                value: 'Quantity',
                                child: Text('Cantidad'),
                              ),
                              DropdownMenuItem(
                                value: 'Time',
                                child: Text('Tiempo'),
                              ),
                              DropdownMenuItem(
                                value: 'Repetitions',
                                child: Text('Repeticiones'),
                              ),
                            ],
                            onChanged: (v) {
                              if (v == null) return;
                              setState(() {
                                _measureType = v;
                              });
                            },
                            initialValue: _measureType,
                            decoration: const InputDecoration(
                              labelText: 'Medida',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Measure section
            SliverToBoxAdapter(child: _sectionHeader('Medida')),
            SliverToBoxAdapter(
              child: _card(
                child: Column(
                  children: [
                    ...widget.initialHabit.measure.when(
                      quantity: (amount, description) => [
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Cantidad',
                            hintText: 'Ej: 8',
                          ),
                          validator: (v) {
                            if (_measureType != 'Quantity') return null;
                            if (v == null || v.trim().isEmpty) {
                              return 'Requerido';
                            }
                            if (int.tryParse(v) == null)
                              return 'Introduce un número';
                            return null;
                          },
                        ),
                        const SizedBox(height: AppConstants.spacingS),
                        TextFormField(
                          controller: _measureDescController,
                          decoration: const InputDecoration(
                            labelText: 'Descripción (opcional)',
                            hintText: 'Ej: Litros',
                          ),
                        ),
                      ],
                      time: (timeInMinutes) => [
                        TextFormField(
                          controller: _minutesController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Minutos',
                            hintText: 'Ej: 30',
                          ),
                          validator: (v) {
                            if (_measureType != 'Time') return null;
                            if (v == null || v.trim().isEmpty) {
                              return 'Requerido';
                            }
                            if (int.tryParse(v) == null)
                              return 'Ingresa un número';
                            return null;
                          },
                        ),
                      ],
                      repetitions: (count, description) => [
                        TextFormField(
                          controller: _repetitionsController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Repeticiones',
                            hintText: 'Ej: 2',
                          ),
                          validator: (v) {
                            if (_measureType != 'Repetitions') return null;
                            if (v == null || v.trim().isEmpty) {
                              return 'Requerido';
                            }
                            if (int.tryParse(v) == null)
                              return 'Ingresa un número';
                            return null;
                          },
                        ),
                        const SizedBox(height: AppConstants.spacingS),
                        TextFormField(
                          controller: _measureDescController,
                          decoration: const InputDecoration(
                            labelText: 'Descripción (opcional)',
                            hintText: 'Ej: Veces al día',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Appearance section
            SliverToBoxAdapter(child: _sectionHeader('Apariencia del icono')),
            SliverToBoxAdapter(
              child: _card(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _pickIcon,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: _bgColor,
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadiusM,
                          ),
                        ),
                        child: Center(
                          child: _selectedIcon != null
                              ? Icon(_selectedIcon, size: 36, color: _iconColor)
                              : Icon(Icons.add, color: _iconColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () => _pickColor(forBackground: false),
                            icon: const Icon(Icons.format_color_fill),
                            label: const Text('Color del icono'),
                          ),
                          TextButton.icon(
                            onPressed: () => _pickColor(forBackground: true),
                            icon: const Icon(Icons.format_color_reset),
                            label: const Text('Fondo del icono'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Reminder section
            SliverToBoxAdapter(child: _sectionHeader('Recordatorio')),
            SliverToBoxAdapter(
              child: _card(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: _reminderEnabled,
                      onChanged: (v) => setState(() => _reminderEnabled = v),
                      title: const Text('Habilitar recordatorio'),
                    ),
                    if (_reminderEnabled)
                      ListTile(
                        leading: const Icon(Icons.access_time),
                        title: Text('Hora: ${_reminderTime.format(context)}'),
                        trailing: TextButton(
                          onPressed: _pickTime,
                          child: const Text('Cambiar'),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: const SizedBox(
                height: 96, // leave space for bottom button
              ),
            ),
          ],
        ),
      ),

      //   },
      //   loading:() => const CircularProgressIndicator(),
      //   error:(error, stackTrace) {
      //     Text('Error');
      //   },
      // ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppConstants.spacingM),
        child: ElevatedButton(
          onPressed: _save,
          // onPressed: () {
          //   notifier.saveChanges;
          // },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusL),
            ),
          ),
          child: const Text('Guardar hábito'),
        ),
      ),
    );
  }
}
