// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allFaculty)
final allFacultyProvider = AllFacultyProvider._();

final class AllFacultyProvider
    extends $FunctionalProvider<List<Faculty>, List<Faculty>, List<Faculty>>
    with $Provider<List<Faculty>> {
  AllFacultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allFacultyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allFacultyHash();

  @$internal
  @override
  $ProviderElement<List<Faculty>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Faculty> create(Ref ref) {
    return allFaculty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Faculty> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Faculty>>(value),
    );
  }
}

String _$allFacultyHash() => r'7b188f4ef6891f7fb49082e408be6b1717083a38';

@ProviderFor(SearchQuery)
final searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'7b915487d1462142cd98f08d298fd276504dd67c';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredFaculty)
final filteredFacultyProvider = FilteredFacultyProvider._();

final class FilteredFacultyProvider
    extends $FunctionalProvider<List<Faculty>, List<Faculty>, List<Faculty>>
    with $Provider<List<Faculty>> {
  FilteredFacultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredFacultyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredFacultyHash();

  @$internal
  @override
  $ProviderElement<List<Faculty>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Faculty> create(Ref ref) {
    return filteredFaculty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Faculty> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Faculty>>(value),
    );
  }
}

String _$filteredFacultyHash() => r'ee17bd7851e1e045857adea9dc7cbab172897c64';
