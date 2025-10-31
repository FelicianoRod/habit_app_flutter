import 'package:habits_app/data/entities/habit_entity.dart';
import 'package:habits_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox.g.dart';

class ObjectBox {
  static ObjectBox? _instance;
  // late final Admin admin;

  ObjectBox._(this.store) {
    // admin = Admin(store);
    _initialData();
  }
  final Store store;

  /// Inicializa y abre el store. Requiere que hayas generado el modelo de ObjectBox
  /// (getObjectBoxModel) con la herramienta de ObjectBox.
  static Future<ObjectBox> create() async {
    if (_instance != null) {
      return _instance!;
    }
    // obtener directorio de datos
    final dir = await getApplicationSupportDirectory();
    // la llamada getObjectBoxModel() es generada por objectbox codegen (build runner)
    final store = await openStore(
      directory: dir.path /*, model: getObjectBoxModel()*/,
    );
    _instance = ObjectBox._(store);
    return _instance!;
  }

  void close() => store.close();

  void _initialData() {
    final habitBox = store.box<HabitEntity>();

    // ✅ Solo insertar si está vacía
    if (habitBox.isEmpty()) {
      final initialHabits = [
        HabitEntity(
          id: 0,
          habitId: DateTime.now().microsecondsSinceEpoch.toString(),
          name: 'Beber agua',
          measureType: 'quantity',
          measureAmount: 8,
          measureDescription: 'Vasos',
          icon: '0xf0ff',
          iconColor: '2196F3',
          iconBackground: 'E3F2FD',
          reminderTimestamp: null,
        ),
        HabitEntity(
          id: 0,
          habitId: (DateTime.now().microsecondsSinceEpoch + 1).toString(),
          name: 'Correr',
          measureType: 'time',
          measureTimeInMinutes: 20,
          icon: '0xf6b4',
          iconColor: '4CAF50',
          iconBackground: 'E8F5E9',
          reminderTimestamp: 1729153300000,
          reminderSound: true,
          reminderVibrate: true,
        ),
        HabitEntity(
          id: 0,
          habitId: (DateTime.now().microsecondsSinceEpoch + 2).toString(),
          name: 'Hacer flexiones',
          measureType: 'repetitions',
          measureRepetitionsCount: 15,
          icon: '0xe3c9',
          iconColor: 'FF5722',
          iconBackground: 'FBE9E7',
          reminderTimestamp: null,
        ),
      ];

      habitBox.putMany(initialHabits);
    }
  }
}

/// Provider asíncrono que expone el servicio ObjectBox
@Riverpod(keepAlive: true)
Future<ObjectBox> objectBox(Ref ref) async {
  final ob = await ObjectBox.create();
  ref.onDispose(() => ob.close());
  return ob;
}
