import 'package:habits_app/domain/models/habit.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class HabitEntity {
  HabitEntity({
    this.id = 0,
    required this.habitId,
    required this.name,
    required this.measureType,
    this.measureAmount,
    this.measureDescription,
    this.measureTimeInMinutes,
    this.measureRepetitionsCount,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    this.reminderTimestamp,
    this.reminderVibrate = true,
    this.reminderSound = true,
  });

  @Id()
  int id; // objectbox native id

  // domain id (string)
  String habitId;

  String name;

  // Measure representation: store a type and its fields
  String measureType; // 'quantity' | 'time' | 'repetitions'
  int? measureAmount;
  String? measureDescription;
  int? measureTimeInMinutes;
  int? measureRepetitionsCount;

  // icon fields
  String icon;
  String iconColor;
  String iconBackground;

  // reminder fields
  int? reminderTimestamp; // epoch millis
  bool reminderVibrate;
  bool reminderSound;

  // Conversión desde dominio -> entidad
  factory HabitEntity.fromDomain(Habit h) {
    // inicializar con un valor por defecto para asegurar que siempre tenga valor
    String type = 'quantity';
    int? amount;
    String? desc;
    int? timeInMinutes;
    int? reps;

    h.measure.map(
      quantity: (q) {
        type = 'quantity';
        amount = q.amount;
        desc = q.description;
      },
      time: (t) {
        type = 'time';
        timeInMinutes = t.timeInMinutes;
      },
      repetitions: (r) {
        type = 'repetitions';
        reps = r.count;
        desc = r.description;
      },
    );

    return HabitEntity(
      habitId: h.id,
      name: h.name,
      measureType: type,
      measureAmount: amount,
      measureDescription: desc,
      measureTimeInMinutes: timeInMinutes,
      measureRepetitionsCount: reps,
      icon: h.icon.icon,
      iconColor: h.icon.iconColor,
      iconBackground: h.icon.backgroundColor,
      reminderTimestamp: h.reminder != null
          ? h.reminder!.time.millisecondsSinceEpoch
          : null,
      reminderVibrate: h.reminder?.vibrate ?? true,
      reminderSound: h.reminder?.sound ?? true,
    );
  }

  // Conversión entidad -> dominio
  Habit toDomain() {
    final Measure measure = (() {
      switch (measureType) {
        case 'quantity':
          return Measure.quantity(
            amount: measureAmount ?? 0,
            description: measureDescription,
          );
        case 'time':
          return Measure.time(timeInMinutes: measureTimeInMinutes ?? 0);
        case 'repetitions':
          return Measure.repetitions(
            count: measureRepetitionsCount ?? 0,
            description: measureDescription,
          );
        default:
          return Measure.quantity(
            amount: measureAmount ?? 0,
            description: measureDescription,
          );
      }
    })();

    final Reminder? reminder = reminderTimestamp != null
        ? Reminder(
            time: DateTime.fromMillisecondsSinceEpoch(reminderTimestamp!),
            vibrate: reminderVibrate,
            sound: reminderSound,
          )
        : null;

    return Habit(
      id: habitId,
      name: name,
      measure: measure,
      reminder: reminder,
      icon: CustomIcon(
        icon: icon,
        iconColor: iconColor,
        backgroundColor: iconBackground,
      ),
    );
  }
}
