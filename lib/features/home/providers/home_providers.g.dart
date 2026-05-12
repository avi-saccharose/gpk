// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(upcomingEventsMap)
final upcomingEventsMapProvider = UpcomingEventsMapProvider._();

final class UpcomingEventsMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, List<Event>>>,
          Map<DateTime, List<Event>>,
          FutureOr<Map<DateTime, List<Event>>>
        >
    with
        $FutureModifier<Map<DateTime, List<Event>>>,
        $FutureProvider<Map<DateTime, List<Event>>> {
  UpcomingEventsMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingEventsMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingEventsMapHash();

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, List<Event>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, List<Event>>> create(Ref ref) {
    return upcomingEventsMap(ref);
  }
}

String _$upcomingEventsMapHash() => r'41bbb492ad2823e868ffdd2502d9a2bb9c7fe9fc';

@ProviderFor(getQuoteOfDay)
final getQuoteOfDayProvider = GetQuoteOfDayProvider._();

final class GetQuoteOfDayProvider
    extends $FunctionalProvider<AsyncValue<Quote>, Quote, FutureOr<Quote>>
    with $FutureModifier<Quote>, $FutureProvider<Quote> {
  GetQuoteOfDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getQuoteOfDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getQuoteOfDayHash();

  @$internal
  @override
  $FutureProviderElement<Quote> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Quote> create(Ref ref) {
    return getQuoteOfDay(ref);
  }
}

String _$getQuoteOfDayHash() => r'0d5abe29fc5a925c74cd924d69da1110d34a6219';
