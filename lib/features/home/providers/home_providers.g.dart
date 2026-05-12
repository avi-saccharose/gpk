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

String _$upcomingEventsMapHash() => r'31b6923324c1df9ff114f3df86486cc50f7cf5a8';
