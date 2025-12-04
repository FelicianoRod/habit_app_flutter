import 'package:flutter/material.dart';
import 'package:habits_app/core/enum/measure.dart';
import 'package:habits_app/domain/models/habit.dart';
import 'package:habits_app/domain/repositories/habit_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_habit_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedMeasure extends _$SelectedMeasure {
  @override
  MeasureEnum build() {
    return MeasureEnum.quantity;
  }

  void setMeasure(MeasureEnum measure) {
    state = measure;
  }
}

@Riverpod(keepAlive: true)
class SelectedTitle extends _$SelectedTitle {
  @override
  String build() {
    return '';
  }

  void changeName(String name) {
    state = name;
  }
}

@Riverpod(keepAlive: true)
class SelectedAmount extends _$SelectedAmount {
  @override
  int build() {
    return 0;
  }

  void changeAmount(int amount) {
    state = amount;
  }
}

@Riverpod(keepAlive: true)
class SelectedDuration extends _$SelectedDuration {
  @override
  Duration build() {
    return Duration(minutes: 10);
  }

  void changeDuration(Duration duration) {
    state = duration;
  }
}

@Riverpod(keepAlive: true)
class SelectedRepetitions extends _$SelectedRepetitions {
  @override
  int build() {
    return 0;
  }

  void changeRepetitios(int repetitions) {
    state = repetitions;
  }
}

@Riverpod(keepAlive: true)
class CustomIconState extends _$CustomIconState {
  @override
  CustomIcon build() {
    return CustomIcon(
      icon: Icons.directions_bike.codePoint.toString(),
      iconColor: "8ABEB9",
      backgroundColor: "305669",
    );
  }

  void setIcon(String id) {
    state = state.copyWith(icon: id);
  }

  void setIconColor(String iconColor) {
    state = state.copyWith(iconColor: iconColor);
  }

  void setBgColor(String bgColor) {
    state = state.copyWith(backgroundColor: bgColor);
  }
}

@riverpod
class setReminder extends _$setReminder {
  @override
  Reminder? build() {
    return null;
  }
}

/// Estado del ViewModel
class CreateHabitState {
  final bool isLoading;
  final String? errorMessage;
  final bool success;

  const CreateHabitState({
    this.isLoading = false,
    this.errorMessage,
    this.success = false,
  });

  CreateHabitState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? success,
  }) {
    return CreateHabitState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      success: success ?? this.success,
    );
  }
}

/// ViewModel encargado de crear hábitos
@riverpod
class CreateHabit extends _$CreateHabit {
  @override
  CreateHabitState build() {
    return const CreateHabitState();
  }

  Future<void> createHabit(
    // {
    // required String name,
    // required Measure measure,
    // Reminder? reminder,
    // required CustomIcon icon,
    // }
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null, success: false);

    try {
      // Obtenemos el repositorio desde el provider generado en habit_repository.dart
      final repo = await ref.watch(habitRepositoryProvider.future);
      // Otros providers
      final m = ref.watch(selectedMeasureProvider);

      late final Measure measure;

      if (m == MeasureEnum.quantity) {
        final amount = ref.watch(selectedAmountProvider);
        measure = Measure.quantity(amount: amount);
      } else if (m == MeasureEnum.time) {
        final time = ref.watch(selectedDurationProvider);
        measure = Measure.time(timeInMinutes: time.inMinutes);
      } else if (m == MeasureEnum.repetitions) {
        final count = ref.watch(selectedRepetitionsProvider);
        measure = Measure.repetitions(count: count);
      }

      final name = ref.watch(selectedTitleProvider);
      final reminder = ref.watch(setReminderProvider);
      final icon = ref.watch(customIconStateProvider);

      final habit = Habit(
        // id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        measure: measure,
        reminder: reminder,
        icon: icon,
      );

      await repo.create(habit);
      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
