// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que expone una implementación concreta (ObjectBox)

@ProviderFor(habitRepository)
const habitRepositoryProvider = HabitRepositoryProvider._();

/// Provider que expone una implementación concreta (ObjectBox)

final class HabitRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<HabitRepository>,
          HabitRepository,
          FutureOr<HabitRepository>
        >
    with $FutureModifier<HabitRepository>, $FutureProvider<HabitRepository> {
  /// Provider que expone una implementación concreta (ObjectBox)
  const HabitRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'habitRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$habitRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<HabitRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HabitRepository> create(Ref ref) {
    return habitRepository(ref);
  }
}

String _$habitRepositoryHash() => r'c2ca4d129f47d42f8aefeb64427f30eb92f9c231';
