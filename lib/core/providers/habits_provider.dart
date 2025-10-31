import 'package:habits_app/domain/models/habit.dart';
import 'package:habits_app/domain/repositories/habit_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_provider.g.dart';

enum FilterType { all, quantity, time, repetitions }

@riverpod
List<FilterType> measureValues(Ref ref) {
  // return FilterType.values.map((e) => e.name).toList();
  return FilterType.values;
}

@Riverpod(keepAlive: true)
class HabitCurrentFilter extends _$HabitCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void setCurrentFilter(FilterType newFilter) {
    state = newFilter;
  }
}

@riverpod
AsyncValue<List<Habit>> filteredHabits(Ref ref) {
  final currentFilter = ref.watch(habitCurrentFilterProvider);
  final habitsAsync = ref.watch(habitsProvider);

  return habitsAsync.when(
    data: (habits) {
      // if (habits == null) return const AsyncValue.data([]);

      switch (currentFilter) {
        case FilterType.all:
          return AsyncValue.data(habits);
        case FilterType.quantity:
          return AsyncValue.data(
            habits.where((h) => h.measure is Quantity).toList(),
          );
        case FilterType.time:
          return AsyncValue.data(
            habits.where((h) => h.measure is TimeMeasure).toList(),
          );
        case FilterType.repetitions:
          return AsyncValue.data(
            habits.where((h) => h.measure is Repetitions).toList(),
          );
      }
    },
    loading: () => const AsyncValue.loading(),
    error: (e, st) => AsyncValue.error(e, st),
  );
}

// await for ( final name in RandomGenerator.randomNameStream() ) {
//   names.add(name);
//   yield names;
// }
@Riverpod(keepAlive: true)
class Habits extends _$Habits {
  @override
  Stream<List<Habit>> build() async* {
    state = const AsyncValue.loading();
    final repo = await ref.watch(habitRepositoryProvider.future);
    try {
      // final stream = repo.watchAll(); // devuelve Stream<List<Habit>>
      // yield* stream;

      // print(await stream.length);
      // state = AsyncValue.data(await stream.first);
      // state = AsyncValue.data(await repo.watchAll());
      await for (final habits in repo.watchAll()) {
        // yield habits;
        state = AsyncValue.data(habits);
      }
    } catch (e, st) {
      // manejar error
      state = AsyncValue.error(e, st);
    }
  }
}

// @riverpod
// Stream<List<Habit>> habits(Ref ref) async* {
//   state = const AsyncValue.loading();
//   final repo = await ref.watch(habitRepositoryProvider.future);
//   try {
//     final stream = repo.watchAll(); // devuelve Stream<List<Habit>>
//     yield* stream;
//   } catch (e, st) {
//     // manejar error
//     state = AsyncValue.error(e, st);
//   }
//   // yield* repo.watchAll(); // devuelve Stream<List<Habit>>
// }
