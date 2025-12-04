import 'package:habits_app/domain/models/habit.dart';
import 'package:habits_app/domain/repositories/habit_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_habit_viewmodel.g.dart';

/*
  Obtener hábito por id para mostrar en el formulario para editar.
*/
@riverpod
class GetHabitById extends _$GetHabitById {
  @override
  Future<Habit?> build(int id) async {
    final repo = await ref.watch(habitRepositoryProvider.future);
    return await repo.getById(id);
  }
}

/*
  Enviar el hábito para que sea editado.
*/
@riverpod
class UpdateHabit extends _$UpdateHabit {
  @override
  void build() {
    // return null;
  }

  void updateHabit({
    required int id,
    required String name,
    required Measure measure,
    Reminder? reminder,
    required CustomIcon icon,
  }) async {
    final habit = Habit(
      // id: DateTime.now().millisecondsSinceEpoch.toString(),
      id: id,
      name: name,
      measure: measure,
      reminder: reminder,
      icon: icon,
    );
    final repo = await ref.watch(habitRepositoryProvider.future);
    return await repo.update(habit);
  }
}

// @riverpod
// class EditHabitNotifier extends _$EditHabitNotifier {
//   @override
//   Habit build(Habit initialHabit) {
//     return initialHabit;
//   }

//   void updateName(String newName) {
//     print(newName);
//     state = state.copyWith(name: newName);
//   }

//   Future<void> saveChanges() async {
//     final repo = await ref.read(habitRepositoryProvider.future);
//     await repo.update(state);
//   }
// }

//
