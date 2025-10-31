// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedMeasure)
const selectedMeasureProvider = SelectedMeasureProvider._();

final class SelectedMeasureProvider
    extends $NotifierProvider<SelectedMeasure, MeasureEnum> {
  const SelectedMeasureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedMeasureProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedMeasureHash();

  @$internal
  @override
  SelectedMeasure create() => SelectedMeasure();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeasureEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeasureEnum>(value),
    );
  }
}

String _$selectedMeasureHash() => r'f10d1b0bd0318d8b216e84c2f7f8454c2b1c2ab4';

abstract class _$SelectedMeasure extends $Notifier<MeasureEnum> {
  MeasureEnum build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MeasureEnum, MeasureEnum>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MeasureEnum, MeasureEnum>,
              MeasureEnum,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectedTitle)
const selectedTitleProvider = SelectedTitleProvider._();

final class SelectedTitleProvider
    extends $NotifierProvider<SelectedTitle, String> {
  const SelectedTitleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTitleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTitleHash();

  @$internal
  @override
  SelectedTitle create() => SelectedTitle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedTitleHash() => r'17dadb475b5a2c6e63c1320038b29de71259f1b1';

abstract class _$SelectedTitle extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectedAmount)
const selectedAmountProvider = SelectedAmountProvider._();

final class SelectedAmountProvider
    extends $NotifierProvider<SelectedAmount, int> {
  const SelectedAmountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAmountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAmountHash();

  @$internal
  @override
  SelectedAmount create() => SelectedAmount();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedAmountHash() => r'a41bf392baec1b533194df81a861f2c240ac1f63';

abstract class _$SelectedAmount extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectedDuration)
const selectedDurationProvider = SelectedDurationProvider._();

final class SelectedDurationProvider
    extends $NotifierProvider<SelectedDuration, Duration> {
  const SelectedDurationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDurationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDurationHash();

  @$internal
  @override
  SelectedDuration create() => SelectedDuration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$selectedDurationHash() => r'620144f605cf12d2df985d662ec77c1d8e6f92b1';

abstract class _$SelectedDuration extends $Notifier<Duration> {
  Duration build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Duration, Duration>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Duration, Duration>,
              Duration,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectedRepetitions)
const selectedRepetitionsProvider = SelectedRepetitionsProvider._();

final class SelectedRepetitionsProvider
    extends $NotifierProvider<SelectedRepetitions, int> {
  const SelectedRepetitionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedRepetitionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedRepetitionsHash();

  @$internal
  @override
  SelectedRepetitions create() => SelectedRepetitions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedRepetitionsHash() =>
    r'e6ce39b59bbc0cd5a1ccd913543bd6b16c5c1f23';

abstract class _$SelectedRepetitions extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CustomIconState)
const customIconStateProvider = CustomIconStateProvider._();

final class CustomIconStateProvider
    extends $NotifierProvider<CustomIconState, CustomIcon> {
  const CustomIconStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customIconStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customIconStateHash();

  @$internal
  @override
  CustomIconState create() => CustomIconState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomIcon value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomIcon>(value),
    );
  }
}

String _$customIconStateHash() => r'd2b20d747e08aa755499453833c9dfad4fe27b31';

abstract class _$CustomIconState extends $Notifier<CustomIcon> {
  CustomIcon build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CustomIcon, CustomIcon>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomIcon, CustomIcon>,
              CustomIcon,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(setReminder)
const setReminderProvider = SetReminderProvider._();

final class SetReminderProvider
    extends $NotifierProvider<setReminder, Reminder?> {
  const SetReminderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setReminderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setReminderHash();

  @$internal
  @override
  setReminder create() => setReminder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Reminder? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Reminder?>(value),
    );
  }
}

String _$setReminderHash() => r'da14f6f8dda1fdff8e3adea6c38cc6300b8a369c';

abstract class _$setReminder extends $Notifier<Reminder?> {
  Reminder? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Reminder?, Reminder?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Reminder?, Reminder?>,
              Reminder?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// ViewModel encargado de crear hábitos

@ProviderFor(CreateHabit)
const createHabitProvider = CreateHabitProvider._();

/// ViewModel encargado de crear hábitos
final class CreateHabitProvider
    extends $NotifierProvider<CreateHabit, CreateHabitState> {
  /// ViewModel encargado de crear hábitos
  const CreateHabitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createHabitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createHabitHash();

  @$internal
  @override
  CreateHabit create() => CreateHabit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateHabitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateHabitState>(value),
    );
  }
}

String _$createHabitHash() => r'2f554ebdcb966bdb6f2d7efe8d6d5abda42d1133';

/// ViewModel encargado de crear hábitos

abstract class _$CreateHabit extends $Notifier<CreateHabitState> {
  CreateHabitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CreateHabitState, CreateHabitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateHabitState, CreateHabitState>,
              CreateHabitState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
