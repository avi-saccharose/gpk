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

final monthlyEventsProvider = Provider<AsyncValue<List<Event>>>((ref) {
  final allEvents = ref.watch(calendarEventsProvider);
  final selectedMonth = ref.watch(selectedMonthProvider);
  return allEvents.whenData((events) {
    // TODO: lookup days of month instead of going through the entire map
    return events.entries
        .where(
          (entry) =>
              entry.key.year == selectedMonth.year &&
              entry.key.month == selectedMonth.month,
        )
        .expand((entry) => entry.value)
        .toList();
  });
});
