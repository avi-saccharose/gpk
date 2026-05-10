import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';
import 'package:gpk_app/core/network/api_server.dart';
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

  Future<(EventGroup, dynamic)> getEventsForCalendar(
    Branch? branch,
    Semester? semester,
  ) async {
    final data = await apiServer.fetch(
      '/calendar/${branch ?? "all"}${semester?.year ?? ""}',
    );
    final String calendarGroup = data["calendarGroup"];
    final EventGroup group = EventGroup.values.byName(calendarGroup);

    return (group, data["events"]);
  }

  // TODO: Very ugly code that does multiple things at once
  Future<EventsMapList> getEvents(
    Branch branch,
    Semester semester, {
    bool forceRefresh = false,
  }) async {
    final String cacheKey = 'calendar$branch';
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
    final events = EventsMapList(
      equals: (a, b) => a.isSameDay(b),
      hashCode: (key) => key.year * 10000 + key.month * 100 + key.day,
    );

    void addEvents(List<dynamic> eventJson, EventGroup group) {
      for (final item in eventJson) {
        final date = DateTime.parse(item['startTime']).normalize();
        final event = Event(title: item['title'], group: group);
        events.putIfAbsent(date, () => []);
        events[date]!.add(event);
      }
    }

    addEvents(allEventsJson, allEventGroup);
    addEvents(branchEventsJson, branchEventGroup);
    cacheService.write(cacheKey, events);
    return events;
  }
}
