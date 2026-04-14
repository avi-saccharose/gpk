// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FocusedDay)
final focusedDayProvider = FocusedDayProvider._();

final class FocusedDayProvider extends $NotifierProvider<FocusedDay, DateTime> {
  FocusedDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'focusedDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$focusedDayHash();

  @$internal
  @override
  FocusedDay create() => FocusedDay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$focusedDayHash() => r'e6bac5d1a8a8fd05a965f1f759381be991cfa106';

abstract class _$FocusedDay extends $Notifier<DateTime> {
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

@ProviderFor(SelectedMonth)
final selectedMonthProvider = SelectedMonthProvider._();

final class SelectedMonthProvider
    extends $NotifierProvider<SelectedMonth, DateTime> {
  SelectedMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedMonthHash();

  @$internal
  @override
  SelectedMonth create() => SelectedMonth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$selectedMonthHash() => r'c5f295dd6a31e8ad939633a53df0a494d8008f03';

abstract class _$SelectedMonth extends $Notifier<DateTime> {
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

@ProviderFor(calendarCacheService)
final calendarCacheServiceProvider = CalendarCacheServiceProvider._();

final class CalendarCacheServiceProvider
    extends $FunctionalProvider<CacheService, CacheService, CacheService>
    with $Provider<CacheService> {
  CalendarCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarCacheServiceHash();

  @$internal
  @override
  $ProviderElement<CacheService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CacheService create(Ref ref) {
    return calendarCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheService>(value),
    );
  }
}

String _$calendarCacheServiceHash() =>
    r'f78c358fded35fcebb977dd72745764aaca28ca6';

@ProviderFor(calendarApi)
final calendarApiProvider = CalendarApiProvider._();

final class CalendarApiProvider
    extends $FunctionalProvider<CalendarApi, CalendarApi, CalendarApi>
    with $Provider<CalendarApi> {
  CalendarApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarApiHash();

  @$internal
  @override
  $ProviderElement<CalendarApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CalendarApi create(Ref ref) {
    return calendarApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalendarApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalendarApi>(value),
    );
  }
}

String _$calendarApiHash() => r'b6dbe50d1d7cb6dd990bdaeffa1fa75b85520ed0';

@ProviderFor(calendarRepository)
final calendarRepositoryProvider = CalendarRepositoryProvider._();

final class CalendarRepositoryProvider
    extends
        $FunctionalProvider<
          CalendarRepository,
          CalendarRepository,
          CalendarRepository
        >
    with $Provider<CalendarRepository> {
  CalendarRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarRepositoryHash();

  @$internal
  @override
  $ProviderElement<CalendarRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalendarRepository create(Ref ref) {
    return calendarRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalendarRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalendarRepository>(value),
    );
  }
}

String _$calendarRepositoryHash() =>
    r'62e8fb46d9155c2e77f3f61504c322403ec6f437';

@ProviderFor(calendarEvents)
final calendarEventsProvider = CalendarEventsProvider._();

final class CalendarEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<EventsMapList>,
          EventsMapList,
          FutureOr<EventsMapList>
        >
    with $FutureModifier<EventsMapList>, $FutureProvider<EventsMapList> {
  CalendarEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarEventsHash();

  @$internal
  @override
  $FutureProviderElement<EventsMapList> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EventsMapList> create(Ref ref) {
    return calendarEvents(ref);
  }
}

String _$calendarEventsHash() => r'9756f9a41d379d1e3bedfa67816806a098154d3d';

@ProviderFor(monthlyEventsMap)
final monthlyEventsMapProvider = MonthlyEventsMapProvider._();

final class MonthlyEventsMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<Event>>>,
          Map<DateTime, List<Event>>,
          FutureOr<Map<DateTime, List<Event>>>
        >
    with
        $FutureModifier<Map<DateTime, List<Event>>>,
        $FutureProvider<Map<DateTime, List<Event>>> {
  MonthlyEventsMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyEventsMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyEventsMapHash();

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<Event>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<Event>>> create(Ref ref) {
    return monthlyEventsMap(ref);
  }
}

String _$monthlyEventsMapHash() => r'0af32bff078bc86cf5b4a7a6e7a96a26ed3729d8';

@ProviderFor(monthlyEvents)
final monthlyEventsProvider = MonthlyEventsProvider._();

final class MonthlyEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MapEntry<DateTime, List<Event>>>>,
          List<MapEntry<DateTime, List<Event>>>,
          FutureOr<List<MapEntry<DateTime, List<Event>>>>
        >
    with
        $FutureModifier<List<MapEntry<DateTime, List<Event>>>>,
        $FutureProvider<List<MapEntry<DateTime, List<Event>>>> {
  MonthlyEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyEventsHash();

  @$internal
  @override
  $FutureProviderElement<List<MapEntry<DateTime, List<Event>>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MapEntry<DateTime, List<Event>>>> create(Ref ref) {
    return monthlyEvents(ref);
  }
}

String _$monthlyEventsHash() => r'a8f6715b62251d505a7371c8ec2afdc4a910dd3c';

@ProviderFor(monthlyEventsList)
final monthlyEventsListProvider = MonthlyEventsListProvider._();

final class MonthlyEventsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Event>>,
          List<Event>,
          FutureOr<List<Event>>
        >
    with $FutureModifier<List<Event>>, $FutureProvider<List<Event>> {
  MonthlyEventsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyEventsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyEventsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Event>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Event>> create(Ref ref) {
    return monthlyEventsList(ref);
  }
}

String _$monthlyEventsListHash() => r'07f3f6323bfb954ce8ec9d6397f81b9a83a0ff09';
