import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/features/calendar/data/calendar_api.dart';
import 'package:gpk_app/features/calendar/data/calendar_repository.dart';
import 'package:gpk_app/features/calendar/data/mock_calendar_api.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

class DateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void set(DateTime time) {
    state = DateTime.utc(time.year, time.month, time.day);
  }
}

final calendarCacheServiceProvide = Provider<CacheService>((ref) {
  throw UnimplementedError();
});

final focusedDayProvider = NotifierProvider<DateNotifier, DateTime>(
  DateNotifier.new,
);

final selectedMonthProvider = NotifierProvider<DateNotifier, DateTime>(
  DateNotifier.new,
);

final calendarApiProvider = Provider<CalendarApi>((ref) {
  return MockCalendarApi();
});

final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  final api = ref.watch(calendarApiProvider);
  final cacheService = ref.watch(calendarCacheServiceProvide);
  return CalendarRepository(api: api, cacheService: cacheService);
});

final calendarEventsProvider = FutureProvider<EventsMapList>((ref) {
  final repo = ref.watch(calendarRepositoryProvider);
  return repo.getEvents();
});

final monthlyEventsMapProvider =
    Provider<AsyncValue<Map<DateTime, List<Event>>>>((Ref ref) {
      final allEvents = ref.watch(calendarEventsProvider);
      final seclectedMonth = ref.watch(selectedMonthProvider);

      return allEvents.whenData(
        (eventsMap) => LinkedHashMap.fromEntries(
          eventsMap.entries.where(
            (entry) =>
                entry.key.year == seclectedMonth.year &&
                entry.key.month == seclectedMonth.month,
          ),
        ),
      );
    });

final monthlyEventsProvider =
    Provider<AsyncValue<List<MapEntry<DateTime, List<Event>>>>>((Ref ref) {
      final allEvents = ref.watch(monthlyEventsMapProvider);
      return allEvents.whenData((eventsMap) => eventsMap.entries.toList());
    });

final monthlyEventsListProvider = Provider<AsyncValue<List<Event>>>((ref) {
  final monthlyEventsMap = ref.watch(monthlyEventsMapProvider);
  return monthlyEventsMap.whenData(
    (eventsMap) => eventsMap.values.expand((eventsList) => eventsList).toList(),
  );
});
