import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

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

  Future<EventsMapList> getEvents({bool forceRefresh = false}) async {
    final events = await apiServer.fetch('/calendar/');
    print(events);
    cacheService.write(cacheKey, events);
    return events;
  }
}
