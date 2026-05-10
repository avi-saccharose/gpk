// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_metadata_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cacheMetadata)
final cacheMetadataProvider = CacheMetadataProvider._();

final class CacheMetadataProvider
    extends $FunctionalProvider<CacheMetadata, CacheMetadata, CacheMetadata>
    with $Provider<CacheMetadata> {
  CacheMetadataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheMetadataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheMetadataHash();

  @$internal
  @override
  $ProviderElement<CacheMetadata> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CacheMetadata create(Ref ref) {
    return cacheMetadata(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheMetadata value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheMetadata>(value),
    );
  }
}

String _$cacheMetadataHash() => r'6092da04cae90d7a3f52a52c55e8e3f1dc0831ea';
