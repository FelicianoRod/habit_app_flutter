import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_app/core/enum/measure.dart';
import 'package:habits_app/core/providers/create_habit_provider.dart';

import '../../../theme/app_constants.dart';

class HabitFormScreen extends ConsumerStatefulWidget {
  const HabitFormScreen({super.key});

  @override
  ConsumerState<HabitFormScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends ConsumerState<HabitFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  // Measure state
  String _measureType = 'Quantity'; // 'Quantity' | 'Time' | 'Repetitions'
  final _amountController = TextEditingController();
  final _minutesController = TextEditingController();
  final _repetitionsController = TextEditingController();
  final _measureDescController = TextEditingController();

  // Appearance
  // IconData? _selectedIcon;
  Color _iconColor = Colors.lightBlue;
  Color _bgColor = Colors.grey;

  // Reminder
  bool _reminderEnabled = false;
  // TimeOfDay _reminderTime = TimeOfDay.now();
  TimeOfDay _reminderTime = TimeOfDay.now();

  DateTime _combineTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  // Duration
  Duration _duration = Duration(hours: 0, minutes: 30);

  Color hexToColor(String hex) {
    // Si viene sin el prefijo #
    hex = hex.replaceAll('#', '');
    // Añadimos FF si no incluye canal alfa
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
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
      ref
          .read(customIconStateProvider.notifier)
          .setIcon(icon.data.codePoint.toString());
      // setState(() {
      // _selectedIcon = icon.data;
      // });
    }
  }

  Future<void> _pickIconColor() async {
    final picked = ref.watch(customIconStateProvider);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Color del icono'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: hexToColor(picked.iconColor),
            onColorChanged: (c) {
              _iconColor = c;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(customIconStateProvider.notifier)
                  .setIconColor(_iconColor.toHexString());
              context.pop();
            },
            child: const Text('Cambiar'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickBgColor() async {
    final picked = ref.watch(customIconStateProvider);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Color del fondo'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: hexToColor(picked.backgroundColor),
            onColorChanged: (c) {
              _bgColor = c;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(customIconStateProvider.notifier)
                  .setBgColor(_bgColor.toHexString());
              context.pop();
            },
            child: const Text('Cambiar'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickTime() async {
    final result = await showDurationPicker(
      context: context,
      initialTime: _duration,
    );
    if (result != null) {
      setState(() => _duration = result);
    }
    // }
    // final TimeOfDay? res = await showTimePicker(
    //   context: context,
    //   initialTime: _reminderTime,
    // );
    // if (res != null) {
    //   setState(() {
    //     _reminderTime = res;
    //   });
    // }
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
    context.go('/habits/measure/form/reminder');
    // final createHabit = ref
    //     .read(createHabitProvider.notifier)
    //     .createHabit(
    //       name: _nameController.text,
    //       measure: _measureType == 'Quantity'
    //           ? Measure.quantity(
    //               amount: int.parse(_amountController.text),
    //               description: _measureDescController.text.isNotEmpty
    //                   ? _measureDescController.text
    //                   : null,
    //             )
    //           : _measureType == 'Time'
    //           ? Measure.time(timeInMinutes: int.parse(_minutesController.text))
    //           : Measure.repetitions(
    //               count: int.parse(_repetitionsController.text),
    //               description: _measureDescController.text.isNotEmpty
    //                   ? _measureDescController.text
    //                   : null,
    //             ),
    //       reminder: _reminderEnabled
    //           ? Reminder(time: _combineTimeOfDay(_reminderTime))
    //           : null,
    //       icon: CustomIcon(
    //         icon: _selectedIcon != null
    //             ? '0x${_selectedIcon!.codePoint.toRadixString(16)}'
    //             : '0xe3af', // default icon code
    //         iconColor: _iconColor.value.toRadixString(16).toUpperCase(),
    //         backgroundColor: _bgColor.value.toRadixString(16).toUpperCase(),
    //       ),
    //     );

    // // debugPrint('Saving habit: $payload');
    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(const SnackBar(content: Text('Habit saved (demo)')));
    // context.pop();
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
    final selectedMeasure = ref.watch(selectedMeasureProvider);
    final selectedIcon = ref.watch(customIconStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Crear hábito'), elevation: 0),
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
                      // controller: _nameController,
                      onChanged: (value) {
                        ref
                            .read(selectedTitleProvider.notifier)
                            .changeName(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ej: Beber agua',
                        prefixIcon: Icon(
                          Icons.run_circle_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    // const SizedBox(height: AppConstants.spacingM),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: DropdownButtonFormField<String>(
                    //         // value: _measureType,
                    //         hint: const Text('Selecciona la medida'),
                    //         items: const [
                    //           DropdownMenuItem(
                    //             value: 'Quantity',
                    //             child: Text('Cantidad'),
                    //           ),
                    //           DropdownMenuItem(
                    //             value: 'Time',
                    //             child: Text('Tiempo'),
                    //           ),
                    //           DropdownMenuItem(
                    //             value: 'Repetitions',
                    //             child: Text('Repeticiones'),
                    //           ),
                    //         ],
                    //         onChanged: (v) {
                    //           if (v == null) return;
                    //           setState(() {
                    //             _measureType = v;
                    //           });
                    //         },
                    //         decoration: const InputDecoration(
                    //           labelText: 'Medida',
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                    if (selectedMeasure == MeasureEnum.quantity) ...[
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
                    if (selectedMeasure == MeasureEnum.time) ...[
                      ListTile(
                        leading: const Icon(Icons.access_time),
                        title: Text(
                          'Duración: ${_duration.inHours}h ${_duration.inMinutes % 60}m',
                        ),
                        trailing: TextButton(
                          onPressed: _pickTime,
                          child: const Text('Cambiar'),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     final result = await showDurationPicker(
                      //       context: context,
                      //       initialTime: _duration,
                      //     );
                      //     if (result != null) {
                      //       setState(() => _duration = result);
                      //     }
                      //   },
                      //   child: const Text("Elegir duración"),
                      // ),
                      // TextFormField(
                      //   controller: _minutesController,
                      //   keyboardType: TextInputType.number,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Minutos',
                      //     hintText: 'Ej: 30',
                      //   ),
                      //   validator: (v) {
                      //     if (_measureType != 'Time') return null;
                      //     if (v == null || v.trim().isEmpty) {
                      //       return 'Requerido';
                      //     }
                      //     if (int.tryParse(v) == null)
                      //       return 'Ingresa un número';
                      //     return null;
                      //   },
                      // ),
                    ],
                    if (selectedMeasure == MeasureEnum.repetitions) ...[
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
                          child: Icon(
                            IconData(
                              int.parse(selectedIcon.icon),
                              fontFamily: "materialIcons",
                            ),
                            size: 36,
                            color: _iconColor,
                          ),
                          // child: _selectedIcon != null
                          //     // ? Icon(_selectedIcon, size: 36, color: _iconColor)
                          //     ? Icon(
                          //         IconData(
                          //           int.parse(selectedIcon.icon),
                          //           fontFamily: "materialIcon",
                          //         ),
                          //         size: 36,
                          //         color: _iconColor,
                          //       )
                          //     : Icon(Icons.add, color: _iconColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () => _pickIconColor(),
                            icon: const Icon(Icons.format_color_fill),
                            label: const Text('Color del icono'),
                          ),
                          TextButton.icon(
                            onPressed: () => _pickBgColor(),
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
            // SliverToBoxAdapter(child: _sectionHeader('Recordatorio')),
            // SliverToBoxAdapter(
            //   child: _card(
            //     child: Column(
            //       children: [
            //         SwitchListTile(
            //           value: _reminderEnabled,
            //           onChanged: (v) => setState(() => _reminderEnabled = v),
            //           title: const Text('Habilitar recordatorio'),
            //         ),
            //         if (_reminderEnabled)
            //           ListTile(
            //             leading: const Icon(Icons.access_time),
            //             title: Text('Hora: ${_reminderTime.format(context)}'),
            //             trailing: TextButton(
            //               onPressed: _pickTime,
            //               child: const Text('Cambiar'),
            //             ),
            //           ),
            //       ],
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 96, // leave space for bottom button
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppConstants.spacingM),
        child: ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusL),
            ),
          ),
          // child: const Text('Guardar hábito'),
          child: const Text('Siguiente'),
        ),
      ),
    );
  }
}
