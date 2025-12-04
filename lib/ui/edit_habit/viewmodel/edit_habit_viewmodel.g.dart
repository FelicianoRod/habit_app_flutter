// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_habit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetHabitById)
const getHabitByIdProvider = GetHabitByIdFamily._();

final class GetHabitByIdProvider
    extends $AsyncNotifierProvider<GetHabitById, Habit?> {
  const GetHabitByIdProvider._({
    required GetHabitByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getHabitByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getHabitByIdHash();

  @override
  String toString() {
    return r'getHabitByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetHabitById create() => GetHabitById();

  @override
  bool operator ==(Object other) {
    return other is GetHabitByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getHabitByIdHash() => r'62425b7a33fd899196bd408ee6f7366ab0902e13';

final class GetHabitByIdFamily extends $Family
    with
        $ClassFamilyOverride<
          GetHabitById,
          AsyncValue<Habit?>,
          Habit?,
          FutureOr<Habit?>,
          int
        > {
  const GetHabitByIdFamily._()
    : super(
        retry: null,
        name: r'getHabitByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetHabitByIdProvider call(int id) =>
      GetHabitByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'getHabitByIdProvider';
}

abstract class _$GetHabitById extends $AsyncNotifier<Habit?> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Habit?> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Habit?>, Habit?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Habit?>, Habit?>,
              AsyncValue<Habit?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(UpdateHabit)
const updateHabitProvider = UpdateHabitProvider._();

final class UpdateHabitProvider extends $NotifierProvider<UpdateHabit, void> {
  const UpdateHabitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateHabitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateHabitHash();

  @$internal
  @override
  UpdateHabit create() => UpdateHabit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$updateHabitHash() => r'29c46de0aa6463c8370933f997fc99fed073c50e';

abstract class _$UpdateHabit extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
