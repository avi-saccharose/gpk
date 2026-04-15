// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiServer, ApiServer, ApiServer>
    with $Provider<ApiServer> {
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiServer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiServer create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiServer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiServer>(value),
    );
  }
}

String _$apiClientHash() => r'9079057e9fd7e0832a581e7fc6e38724b88cbaa6';
