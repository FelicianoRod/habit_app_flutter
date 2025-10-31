import 'package:habits_app/data/repositories/habit_repository_imp.dart';
import 'package:habits_app/data/service/objectbox.dart';
import 'package:habits_app/domain/models/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_repository.g.dart';

abstract class HabitRepository {
  Stream<List<Habit>> watchAll();
  Future<void> create(HabitCreationPayload payload);
  Future<List<Habit>> getAll();
  Future<Habit?> getById(String id);
  Future<void> update(Habit payload);
  Future<void> delete(String id);
}

/// Provider que expone una implementación concreta (ObjectBox)
@riverpod
Future<HabitRepository> habitRepository(Ref ref) async {
  final ob = await ref.watch(objectBoxProvider.future);
  return Future.value(HabitRepositoryImp(ob.store));
  // return HabitRepositoryImp(ob.store);
}

// Helper types to avoid depending on domain file within interface file
// (we'll import domain models inside implementation).
