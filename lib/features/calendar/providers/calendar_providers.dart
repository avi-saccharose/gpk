import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    state = time;
  }
}

final focusedDayProvider = NotifierProvider<DateNotifier, DateTime>(
  DateNotifier.new,
);

final calendarApiProvider = Provider<CalendarApi>((ref) {
  return MockCalendarApi();
});

final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  final api = ref.watch(calendarApiProvider);
  return CalendarRepository(api);
});

final calendarEventsProvider = FutureProvider<EventsMapList>((ref) {
  final repo = ref.watch(calendarRepositoryProvider);
  return repo.getEvents();
});
