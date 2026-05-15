import 'dart:collection';

import 'package:gpk_app/core/cache/cache_metadata.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/models/event_wrapper.dart';

class CalendarRepository {
  final ApiServer apiServer;
  final CacheService cacheService;
  final CacheMetadata cacheMetadata;
  final Duration cacheDuration;

  CalendarRepository({
    required this.apiServer,
    required this.cacheService,
    required this.cacheMetadata,
    this.cacheDuration = const Duration(hours: 5),
  });

  Future<(EventGroup, dynamic)> getEventsForCalendar(
    Branch? branch,
    Semester? semester,
  ) async {
    final data = await apiServer.fetch(
      '/calendar/${branch ?? "all"}${semester?.year ?? ""}',
    );
    final String calendarGroup = data['calendarGroup'];
    final EventGroup group = EventGroup.values.byName(calendarGroup);

    return (group, data['events']);
  }

  Future<EventsMapList> getEvents(Branch branch, Semester semester) async {
    final String cacheKey = 'calendar$branch${semester.year}';

    if (cacheMetadata.isCacheValid(cacheKey, cacheDuration)) {
      final cachedEvents = await cacheService.get(cacheKey);
      if (cachedEvents != null) {
        Log.info(
          'Calendar Event: Returning cache (Age: $cacheDuration mins)',
        );
        return cachedEvents.events;
      }
    }

    final result = await Future.wait([
      getEventsForCalendar(
        null,
        null,
      ),
      getEventsForCalendar(
        branch,
        semester,
      ),
    ]);

    final (allEventGroup, allEventsJson) = result[0];
    final (branchEventGroup, branchEventsJson) = result[1];

    // final events = EventsMapList(
    //   equals: (a, b) => a.isSameDay(b),
    //   hashCode: (key) => key.year * 10000 + key.month * 100 + key.day,
    // );

    // We need to preserve sort
    final sortedEvents = SplayTreeMap<DateTime, List<Event>>(
      (DateTime a, DateTime b) => a.compareTo(b),
    );

    void addEvents(List<dynamic> eventJson, EventGroup group) {
      for (final item in eventJson) {
        final date = DateTime.parse(item['startTime']).normalize();
        final event = Event(title: item['title'], group: group);
        sortedEvents.putIfAbsent(date, () => []);
        sortedEvents[date]!.add(event);
      }
    }

    addEvents(allEventsJson, allEventGroup);
    addEvents(branchEventsJson, branchEventGroup);

    // and then convert it back to linkedHashMap
    final eventsMap = EventsMapList(
      equals: (a, b) => a.isSameDay(b),
      hashCode: (key) => key.year * 10000 + key.month * 100 + key.day,
    )..addAll(sortedEvents);

    final eventsWrapper = EventWrapper(eventsMap);
    await cacheService.write(cacheKey, eventsWrapper);
    await cacheMetadata.updateCacheTimeStamp(cacheKey);

    return eventsMap;
  }
}
