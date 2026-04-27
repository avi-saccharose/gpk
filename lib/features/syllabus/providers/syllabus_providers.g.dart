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

String _$syllabusHash() => r'570d4da450f07a16500c6cb4c4ec8f52fcd15ebf';

@ProviderFor(subjectByCode)
final subjectByCodeProvider = SubjectByCodeFamily._();

final class SubjectByCodeProvider
    extends
        $FunctionalProvider<AsyncValue<Subject?>, Subject?, FutureOr<Subject?>>
    with $FutureModifier<Subject?>, $FutureProvider<Subject?> {
  SubjectByCodeProvider._({
    required SubjectByCodeFamily super.from,
    required SubjectCode super.argument,
  }) : super(
         retry: null,
         name: r'subjectByCodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subjectByCodeHash();

  @override
  String toString() {
    return r'subjectByCodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Subject?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Subject?> create(Ref ref) {
    final argument = this.argument as SubjectCode;
    return subjectByCode(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectByCodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subjectByCodeHash() => r'99d6899605961a2f68c477dc91ab2cfa064a7a27';

final class SubjectByCodeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Subject?>, SubjectCode> {
  SubjectByCodeFamily._()
    : super(
        retry: null,
        name: r'subjectByCodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SubjectByCodeProvider call(SubjectCode subjectCode) =>
      SubjectByCodeProvider._(argument: subjectCode, from: this);

  @override
  String toString() => r'subjectByCodeProvider';
}
