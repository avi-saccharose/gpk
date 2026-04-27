// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabus_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sylllabusCacheService)
final sylllabusCacheServiceProvider = SylllabusCacheServiceProvider._();

final class SylllabusCacheServiceProvider
    extends
        $FunctionalProvider<
          CacheService<dynamic>,
          CacheService<dynamic>,
          CacheService<dynamic>
        >
    with $Provider<CacheService<dynamic>> {
  SylllabusCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sylllabusCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sylllabusCacheServiceHash();

  @$internal
  @override
  $ProviderElement<CacheService<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CacheService<dynamic> create(Ref ref) {
    return sylllabusCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService<dynamic>>(value),
    );
  }
}

String _$sylllabusCacheServiceHash() =>
    r'65a6702db9788eb12a6e25dbf22dd25e5a7602a2';

@ProviderFor(syllabusRepository)
final syllabusRepositoryProvider = SyllabusRepositoryProvider._();

final class SyllabusRepositoryProvider
    extends
        $FunctionalProvider<
          SyllabusRepository,
          SyllabusRepository,
          SyllabusRepository
        >
    with $Provider<SyllabusRepository> {
  SyllabusRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syllabusRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syllabusRepositoryHash();

  @$internal
  @override
  $ProviderElement<SyllabusRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyllabusRepository create(Ref ref) {
    return syllabusRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyllabusRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyllabusRepository>(value),
    );
  }
}

String _$syllabusRepositoryHash() =>
    r'8c89b108e0ce311b1997f68cd7c0570d32e1fa0c';

@ProviderFor(syllabus)
final syllabusProvider = SyllabusProvider._();

final class SyllabusProvider
    extends
        $FunctionalProvider<AsyncValue<Syllabus>, Syllabus, FutureOr<Syllabus>>
    with $FutureModifier<Syllabus>, $FutureProvider<Syllabus> {
  SyllabusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syllabusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syllabusHash();

  @$internal
  @override
  $FutureProviderElement<Syllabus> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Syllabus> create(Ref ref) {
    return syllabus(ref);
  }
}

String _$syllabusHash() => r'c973099de3d7c4649304f86af1826a1f62c3c48b';
