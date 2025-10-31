import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String name,
    required Measure measure,
    Reminder? reminder,
    required CustomIcon icon,
  }) = _Habit;
}

@freezed
abstract class CustomIcon with _$CustomIcon {
  const factory CustomIcon({
    required String icon,
    required String iconColor,
    required String backgroundColor,
  }) = _CustomIcon;
}

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    @Default(false) bool isCompleted,
  }) = _Task;
}

@freezed
abstract class Reminder with _$Reminder {
  const factory Reminder({
    required DateTime time,
    // required DateTime time,
    @Default(true) bool vibrate,
    @Default(true) bool sound,
  }) = _Reminder;
}

// Nueva union para representar la "Medida" con 3 variantes:
// - Quantity: recibe un entero (amount) y una descripción opcional
// - TimeMeasure: recibe tiempo en minutos (timeInMinutes)
// - Repetitions: acepta un entero (count) y una descripción opcional
// @Freezed(fromJson: true, toJson: true)
@freezed
abstract class Measure with _$Measure {
  const factory Measure.quantity({required int amount, String? description}) =
      Quantity;

  const factory Measure.time({required int timeInMinutes}) = TimeMeasure;

  const factory Measure.repetitions({required int count, String? description}) =
      Repetitions;

  // factory Measure.fromJson(Map<String, dynamic> json) =>
  // _$MeasureFromJson(json);
}
// fjk