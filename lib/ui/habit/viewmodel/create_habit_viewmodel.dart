// part 'create_habit_viewmodel.g.dart';

// /// Estado del ViewModel
// class CreateHabitState {
//   final bool isLoading;
//   final String? errorMessage;
//   final bool success;

//   const CreateHabitState({
//     this.isLoading = false,
//     this.errorMessage,
//     this.success = false,
//   });

//   CreateHabitState copyWith({
//     bool? isLoading,
//     String? errorMessage,
//     bool? success,
//   }) {
//     return CreateHabitState(
//       isLoading: isLoading ?? this.isLoading,
//       errorMessage: errorMessage,
//       success: success ?? this.success,
//     );
//   }
// }

// /// ViewModel encargado de crear hábitos
// @riverpod
// class CreateHabit extends _$CreateHabit {
//   @override
//   CreateHabitState build() {
//     return const CreateHabitState();
//   }

//   Future<void> createHabit({
//     required String name,
//     required Measure measure,
//     Reminder? reminder,
//     required CustomIcon icon,
//   }) async {
//     state = state.copyWith(isLoading: true, errorMessage: null, success: false);

//     try {
//       // Obtenemos el repositorio desde el provider generado en habit_repository.dart
//       final repo = await ref.watch(habitRepositoryProvider.future);

//       final habit = HabitCreationPayload(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: name,
//         measure: measure,
//         reminder: reminder,
//         icon: icon,
//       );

//       await repo.create(habit);
//       state = state.copyWith(isLoading: false, success: true);
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         errorMessage: e.toString(),
//         success: false,
//       );
//     }
//   }
// }

/// Provider que devuelve la lista completa de hábitos
// @riverpod
// Future<List<Habit>> habitsList(Ref ref) async {
//   final repo = await ref.watch(habitRepositoryProvider.future);
//   return repo.getAll();
// }
