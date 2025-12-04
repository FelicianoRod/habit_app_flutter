import 'package:habits_app/domain/models/habit.dart';

enum MeasureEnum { quantity, time, repetitions }

extension MeasureX on Measure {
  MeasureEnum toEnum() {
    return when(
      quantity: (_, __) => MeasureEnum.quantity,
      time: (_) => MeasureEnum.time,
      repetitions: (_, __) => MeasureEnum.repetitions,
    );
  }
}
