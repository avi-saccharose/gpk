// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DateNotifier)
final selectedDayProvider = DateNotifierProvider._();

final class DateNotifierProvider
    extends $NotifierProvider<DateNotifier, DateTime> {
  DateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dateNotifierHash();

  @$internal
  @override
  DateNotifier create() => DateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$dateNotifierHash() => r'cb1870e59aa8edcabaeb96ab309c99544208fc84';

abstract class _$DateNotifier extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(routineCacheService)
final routineCacheServiceProvider = RoutineCacheServiceProvider._();

final class RoutineCacheServiceProvider
    extends $FunctionalProvider<CacheService, CacheService, CacheService>
    with $Provider<CacheService> {
  RoutineCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routineCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routineCacheServiceHash();

  @$internal
  @override
  $ProviderElement<CacheService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CacheService create(Ref ref) {
    return routineCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService>(value),
    );
  }
}

String _$routineCacheServiceHash() =>
    r'80af1a8859547ae5ac32843357dd12a339ba9004';

@ProviderFor(routineApiServer)
final routineApiServerProvider = RoutineApiServerProvider._();

final class RoutineApiServerProvider
    extends $FunctionalProvider<ApiServer, ApiServer, ApiServer>
    with $Provider<ApiServer> {
  RoutineApiServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routineApiServerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routineApiServerHash();

  @$internal
  @override
  $ProviderElement<ApiServer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiServer create(Ref ref) {
    return routineApiServer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiServer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiServer>(value),
    );
  }
}

String _$routineApiServerHash() => r'c283f6d7c984150129cf97568e87c552e377ff67';

@ProviderFor(routineRepository)
final routineRepositoryProvider = RoutineRepositoryProvider._();

final class RoutineRepositoryProvider
    extends
        $FunctionalProvider<
          RoutineRepository,
          RoutineRepository,
          RoutineRepository
        >
    with $Provider<RoutineRepository> {
  RoutineRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routineRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routineRepositoryHash();

  @$internal
  @override
  $ProviderElement<RoutineRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoutineRepository create(Ref ref) {
    return routineRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutineRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutineRepository>(value),
    );
  }
}

String _$routineRepositoryHash() => r'152bc7ff9317b6d755dba3891d3863f6416d108d';
