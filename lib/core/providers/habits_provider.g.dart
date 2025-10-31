// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(measureValues)
const measureValuesProvider = MeasureValuesProvider._();

final class MeasureValuesProvider
    extends
        $FunctionalProvider<
          List<FilterType>,
          List<FilterType>,
          List<FilterType>
        >
    with $Provider<List<FilterType>> {
  const MeasureValuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'measureValuesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$measureValuesHash();

  @$internal
  @override
  $ProviderElement<List<FilterType>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<FilterType> create(Ref ref) {
    return measureValues(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FilterType> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FilterType>>(value),
    );
  }
}

String _$measureValuesHash() => r'bb06fbf913e8f6abce71f7fb7c5216b3cda8c61c';

@ProviderFor(HabitCurrentFilter)
const habitCurrentFilterProvider = HabitCurrentFilterProvider._();

final class HabitCurrentFilterProvider
    extends $NotifierProvider<HabitCurrentFilter, FilterType> {
  const HabitCurrentFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'habitCurrentFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$habitCurrentFilterHash();

  @$internal
  @override
  HabitCurrentFilter create() => HabitCurrentFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilterType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilterType>(value),
    );
  }
}

String _$habitCurrentFilterHash() =>
    r'ff852cb257cdbae61aa7349942f99e6bb3b8b607';

abstract class _$HabitCurrentFilter extends $Notifier<FilterType> {
  FilterType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FilterType, FilterType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FilterType, FilterType>,
              FilterType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredHabits)
const filteredHabitsProvider = FilteredHabitsProvider._();

final class FilteredHabitsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Habit>>,
          AsyncValue<List<Habit>>,
          AsyncValue<List<Habit>>
        >
    with $Provider<AsyncValue<List<Habit>>> {
  const FilteredHabitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredHabitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredHabitsHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<Habit>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Habit>> create(Ref ref) {
    return filteredHabits(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Habit>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Habit>>>(value),
    );
  }
}

String _$filteredHabitsHash() => r'7f89da36781d128c70e1da36122159917e177622';

@ProviderFor(Habits)
const habitsProvider = HabitsProvider._();

final class HabitsProvider
    extends $StreamNotifierProvider<Habits, List<Habit>> {
  const HabitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'habitsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$habitsHash();

  @$internal
  @override
  Habits create() => Habits();
}

String _$habitsHash() => r'3229e0c7980f339ee7a2d4d8cfc57e944213a83b';

abstract class _$Habits extends $StreamNotifier<List<Habit>> {
  Stream<List<Habit>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Habit>>, List<Habit>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Habit>>, List<Habit>>,
              AsyncValue<List<Habit>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
