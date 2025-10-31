import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_app/core/providers/create_habit_provider.dart';
import 'package:habits_app/theme/app_constants.dart';

class ReminderScreen extends ConsumerStatefulWidget {
  const ReminderScreen({super.key});

  @override
  ConsumerState<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends ConsumerState<ReminderScreen> {
  // Reminder
  bool _reminderEnabled = false;

  // TimeOfDay _reminderTime = TimeOfDay.now();
  TimeOfDay _reminderTime = TimeOfDay.now();

  DateTime _combineTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recordatorio')),
      body: Column(
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
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(AppConstants.spacingM),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusL),
            ),
          ),
          child: Text('Crear hábito'),
          onPressed: () {
            ref.read(createHabitProvider.notifier).createHabit();
            context.go('/habits');
          },
        ),
      ),
    );
  }
}
