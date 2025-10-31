// import 'package:habits_app/data/entities/habit_entity.dart';
// import 'package:objectbox/objectbox.dart';

// @Entity()
// class HabitLog {
//   HabitLog({
//     this.id = 0,
//     ToOne<HabitEntity>? habit,
//     required this.date,
//     required this.progressValue,
//     this.completed = false,
//     this.notes,
//   }) : habit = habit ?? ToOne<HabitEntity>();

//   @Id()
//   int id; // objectbox native id (Long)

//   // Relación con el hábito
//   final ToOne<HabitEntity> habit;

//   // Día registrado
//   @Property(type: PropertyType.date)
//   DateTime date;

//   // Valor alcanzado (ej. 8 minutos, 4 vasos, 2 veces)
//   double progressValue;

//   // Si cumplió la meta o no
//   bool completed;

//   // Comentarios opcionales
//   String? notes;
// }
