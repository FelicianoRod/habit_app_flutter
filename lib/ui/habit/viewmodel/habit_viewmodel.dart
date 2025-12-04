import 'package:habits_app/domain/repositories/habit_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_viewmodel.g.dart';

@riverpod
Future<void> deleteHabit(Ref ref, int id) async {
  final repo = ref.watch(habitRepositoryProvider.future);
  repo.then((r) => r.delete(id));
}
