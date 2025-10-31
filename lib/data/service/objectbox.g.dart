// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectbox.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider asíncrono que expone el servicio ObjectBox

@ProviderFor(objectBox)
const objectBoxProvider = ObjectBoxProvider._();

/// Provider asíncrono que expone el servicio ObjectBox

final class ObjectBoxProvider
    extends
        $FunctionalProvider<
          AsyncValue<ObjectBox>,
          ObjectBox,
          FutureOr<ObjectBox>
        >
    with $FutureModifier<ObjectBox>, $FutureProvider<ObjectBox> {
  /// Provider asíncrono que expone el servicio ObjectBox
  const ObjectBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'objectBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$objectBoxHash();

  @$internal
  @override
  $FutureProviderElement<ObjectBox> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ObjectBox> create(Ref ref) {
    return objectBox(ref);
  }
}

String _$objectBoxHash() => r'00448b653f6593d742e77a8bd32129ff9b848e0f';
