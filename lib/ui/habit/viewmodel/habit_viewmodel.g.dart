// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteHabit)
const deleteHabitProvider = DeleteHabitFamily._();

final class DeleteHabitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteHabitProvider._({
    required DeleteHabitFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'deleteHabitProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteHabitHash();

  @override
  String toString() {
    return r'deleteHabitProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return deleteHabit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteHabitProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteHabitHash() => r'42e9d01dfff6d15e7a9bff34f5c9bf6c72a24c14';

final class DeleteHabitFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  const DeleteHabitFamily._()
    : super(
        retry: null,
        name: r'deleteHabitProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteHabitProvider call(int id) =>
      DeleteHabitProvider._(argument: id, from: this);

  @override
  String toString() => r'deleteHabitProvider';
}
