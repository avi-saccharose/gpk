import 'dart:convert';

import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';

class CalendarRepository {
  final ApiServer apiServer;
  final CacheService cacheService;
  final Duration cacheDuration;
  final String cacheKey = 'calendar_events';

  CalendarRepository({
    required this.apiServer,
    required this.cacheService,
    this.cacheDuration = const Duration(days: 1),
  });

  Future<EventsMapList> getCachedEvents() async {
    final dynamic rawData = await cacheService.get(cacheKey);
    if (rawData == null) {
      return EventsMapList();
    }
    final EventsMapList typedData = EventsMapList();
    (rawData as Map).forEach((key, value) {
      if (key is DateTime && value is List) {
        typedData[key] = value.cast<Event>();
      }
    });

    return typedData;
  }

  Future<(EventGroup, dynamic)> getEventsForCalendar(Branch? branch) async {
    final data = await apiServer.fetch('/calendar/${branch ?? "all"}');
    final String calendarGroup = data["calendarGroup"];
    final EventGroup group = EventGroup.values.byName(calendarGroup);

    return (group, data["events"]);
  }

  // TODO: Very ugly code that does multiple things at once
  Future<EventsMapList> getEvents(
    Branch branch, {
    bool forceRefresh = false,
  }) async {
    final String cacheKey = 'calendar$branch';
    final (allEventGroup, allEventsJson) = await getEventsForCalendar(null);
    final (branchEventGroup, branchEventsJson) = await getEventsForCalendar(
      branch,
    );

    final events = EventsMapList(
      equals: (a, b) => a.isSameDay(b),
      hashCode: (key) => key.year * 10000 + key.month * 100 + key.day,
    );

    void addEvents(Map<String, dynamic> eventJson, EventGroup group) {
      final date = DateTime.parse(eventJson['startTime']).normalize();
      final event = Event(title: eventJson['title'], group: group);
      events.putIfAbsent(date, () => []);
      events[date]!.add(event);
    }

    addEvents(allEventsJson, allEventGroup);
    addEvents(branchEventsJson, branchEventGroup);
    cacheService.write(cacheKey, events);
    return events;
  }
}
