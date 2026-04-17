// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedDay)
final selectedDayProvider = SelectedDayProvider._();

final class SelectedDayProvider
    extends $NotifierProvider<SelectedDay, DateTime> {
  SelectedDayProvider._()
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
  String debugGetCreateSourceHash() => _$selectedDayHash();

  @$internal
  @override
  SelectedDay create() => SelectedDay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$selectedDayHash() => r'd143bf7b3ecd9a6506e8e326109bd3b53132f35c';

abstract class _$SelectedDay extends $Notifier<DateTime> {
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
    extends
        $FunctionalProvider<
          CacheService<dynamic>,
          CacheService<dynamic>,
          CacheService<dynamic>
        >
    with $Provider<CacheService<dynamic>> {
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
  $ProviderElement<CacheService<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CacheService<dynamic> create(Ref ref) {
    return routineCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService<dynamic>>(value),
    );
  }
}

String _$routineCacheServiceHash() =>
    r'80af1a8859547ae5ac32843357dd12a339ba9004';

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

String _$routineRepositoryHash() => r'706c21ba45935b10e29e8831cdd4c51088fbc5d6';

@ProviderFor(routine)
final routineProvider = RoutineFamily._();

final class RoutineProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimelineItem>>,
          List<TimelineItem>,
          FutureOr<List<TimelineItem>>
        >
    with
        $FutureModifier<List<TimelineItem>>,
        $FutureProvider<List<TimelineItem>> {
  RoutineProvider._({
    required RoutineFamily super.from,
    required (Branch, int) super.argument,
  }) : super(
         retry: null,
         name: r'routineProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routineHash();

  @override
  String toString() {
    return r'routineProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<TimelineItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimelineItem>> create(Ref ref) {
    final argument = this.argument as (Branch, int);
    return routine(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is RoutineProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routineHash() => r'b9c4ea88feafa082231457bae9007d6f97bfa431';

final class RoutineFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<TimelineItem>>, (Branch, int)> {
  RoutineFamily._()
    : super(
        retry: null,
        name: r'routineProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RoutineProvider call(Branch branch, int semester) =>
      RoutineProvider._(argument: (branch, semester), from: this);

  @override
  String toString() => r'routineProvider';
}

@ProviderFor(minuteTicker)
final minuteTickerProvider = MinuteTickerProvider._();

final class MinuteTickerProvider
    extends $FunctionalProvider<AsyncValue<void>, void, Stream<void>>
    with $FutureModifier<void>, $StreamProvider<void> {
  MinuteTickerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'minuteTickerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$minuteTickerHash();

  @$internal
  @override
  $StreamProviderElement<void> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<void> create(Ref ref) {
    return minuteTicker(ref);
  }
}

String _$minuteTickerHash() => r'e6b0ede6cd8fe1734ce839f851e810abce752bda';
