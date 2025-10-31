import 'dart:developer' as developer;

import 'package:habits_app/data/entities/habit_entity.dart';
import 'package:habits_app/domain/models/habit.dart';
import 'package:habits_app/domain/repositories/habit_repository.dart';
import 'package:habits_app/objectbox.g.dart';

class HabitRepositoryImp implements HabitRepository {
  HabitRepositoryImp(this.store) : _box = Box<HabitEntity>(store);

  final Store store;
  final Box<HabitEntity> _box;

  // // Build and watch the query,
  // // set triggerImmediately to emit the query immediately on listen.
  // return box.query(condition)
  //     .watch(triggerImmediately: true)
  //     // Map it to a list of objects to be used by a StreamBuilder.
  //     .map((query) => query.find());

  @override
  Stream<List<Habit>> watchAll() async* {
    // final query = _box.query().build();
    // return query
    //     .watch(triggerImmediately: true)
    //     .map((q) => q.find());
    // final query = _box.query().build();
    // final stream = query.watch(triggerImmediately: true).map((q) {
    //   final list = q.find();
    //   developer.log('HabitRepositoryImp.watchAll: ${list.length} habits found');
    //   return list.map((e) => e.toDomain()).toList();
    // });
    // return stream;
    try {
      yield* _box.query().watch(triggerImmediately: true).map((q) {
        final list = q.find();
        return list.map((e) => e.toDomain()).toList();
      });
    } catch (e, st) {
      developer.log('HabitRepositoryImp.watchAll: error $e', stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> create(HabitCreationPayload payload) async {
    // si el payload no tiene id, generar uno simple
    final id = payload.id ?? DateTime.now().microsecondsSinceEpoch.toString();
    final domain = Habit(
      id: id,
      name: payload.name,
      measure: payload.measure,
      reminder: payload.reminder,
      icon: payload.icon,
    );
    final entity = HabitEntity.fromDomain(domain);
    _box.put(entity);
  }

  @override
  Future<List<Habit>> getAll() async {
    final list = _box.getAll();
    return list.map((e) => e.toDomain()).toList();
  }

  @override
  Future<Habit?> getById(String id) async {
    final q = _box.query(HabitEntity_.habitId.equals(id)).build();
    final res = q.find();
    q.close();
    if (res.isEmpty) return null;
    return res.first.toDomain();
  }

  @override
  Future<void> update(Habit payload) async {
    // buscar entidad por habitId
    final q = _box.query(HabitEntity_.habitId.equals(payload.id)).build();
    final found = q.find();
    q.close();
    if (found.isEmpty) {
      // crear si no existe
      final e = HabitEntity.fromDomain(payload);
      _box.put(e);
      return;
    }
    final entity = found.first;
    // actualizar campos
    final updated = HabitEntity.fromDomain(payload)..id = entity.id;
    _box.put(updated);
  }

  @override
  Future<void> delete(String id) async {
    final q = _box.query(HabitEntity_.habitId.equals(id)).build();
    final found = q.find();
    q.close();
    if (found.isEmpty) return;
    _box.remove(found.first.id);
  }
}

// Nota: HabitCreationPayload y uso de domain models
// Creamos un pequeño payload para crear sin depender de freezed internals.
// Si prefieres pasar Habit directamente, adapta create(Habit) y elimina HabitCreationPayload.
class HabitCreationPayload {
  HabitCreationPayload({
    this.id,
    required this.name,
    required this.measure,
    this.reminder,
    required this.icon,
  });

  final String? id;
  final String name;
  final Measure measure;
  final Reminder? reminder;
  final CustomIcon icon;
}
