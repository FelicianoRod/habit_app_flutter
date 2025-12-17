import 'package:flutter/material.dart';

import '../../../domain/models/habit.dart';
import '../../../theme/app_constants.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  const HabitCard({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showActions(context, habit);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
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
                  Row(
                    children: [
                      Text('🔥'),
                      const SizedBox(width: 6),
                      Text(
                        'Racha',
                        style: Theme.of(context).textTheme.bodySmall,
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
                ),
                const SizedBox(height: 6),
                Text(
                  _measureUnitLabel(habit.measure),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(width: 6),
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              // color: Colors.greenAccent,
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
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

  // String _measureUnitLabel(Habit habit) {
  //   return habit.measure.map(
  //     quantity: (q) =>
  //         (q.description?.isNotEmpty ?? false) ? q.description! : 'units',
  //     time: (t) => 'time',
  //     repetitions: (r) =>
  //         (r.description?.isNotEmpty ?? false) ? r.description! : 'times',
  //   );
  // }

  String _measureUnitLabel(Measure measure) {
    return measure.when(
      quantity: (amount, description) {
        return (description?.isNotEmpty ?? false) ? description! : 'Cantidad';
      },
      time: (timeInMinutes) {
        return 'Tiempo';
      },
      repetitions: (count, description) {
        return description?.isNotEmpty ?? false ? description! : 'Repeticiones';
      },
    );
  }

  void _showActions(BuildContext context, Habit habit) {
    habit.measure.when(
      quantity: (amount, description) {
        return AlertDialog(content: Text("sk"));
      },
      time: (timeInMinutes) {
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     // return AlertDialog(
        //     //   content: TimerWidget(
        //     //     duration: Duration(minutes: timeInMinutes),
        //     //     onTimerCompleted: () {},
        //     //   ),
        //     // );
        //   },
        // );
      },
      repetitions: (count, description) {},
    );
  }
}
