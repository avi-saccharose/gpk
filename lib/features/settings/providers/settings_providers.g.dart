// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsCacheService)
final settingsCacheServiceProvider = SettingsCacheServiceProvider._();

final class SettingsCacheServiceProvider
    extends
        $FunctionalProvider<
          CacheService<dynamic>,
          CacheService<dynamic>,
          CacheService<dynamic>
        >
    with $Provider<CacheService<dynamic>> {
  SettingsCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsCacheServiceHash();

  @$internal
  @override
  $ProviderElement<CacheService<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CacheService<dynamic> create(Ref ref) {
    return settingsCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService<dynamic>>(value),
    );
  }
}

String _$settingsCacheServiceHash() =>
    r'93248c449755fcd91fe1e399a700f08e5a30985f';

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'cb5022108bc0715ba694737ed524caa20a8aba5b';

@ProviderFor(SettingsNotifier)
final settingsProvider = SettingsNotifierProvider._();

final class SettingsNotifierProvider
    extends $NotifierProvider<SettingsNotifier, UserPreferences> {
  SettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsNotifierHash();

  @$internal
  @override
  SettingsNotifier create() => SettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPreferences>(value),
    );
  }
}

String _$settingsNotifierHash() => r'1760b08e1aff79f84a74fce5223253089e1b0ef5';

abstract class _$SettingsNotifier extends $Notifier<UserPreferences> {
  UserPreferences build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserPreferences, UserPreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserPreferences, UserPreferences>,
              UserPreferences,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
