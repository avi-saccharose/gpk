import 'dart:collection';

import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/features/calendar/data/calendar_api.dart';
import 'package:gpk_app/features/calendar/data/calendar_repository.dart';
import 'package:gpk_app/features/calendar/data/mock_calendar_api.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_providers.g.dart';

@riverpod
class FocusedDay extends _$FocusedDay {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void set(DateTime time) {
    state = DateTime.utc(time.year, time.month, time.day);
  }
}

@riverpod
class SelectedMonth extends _$SelectedMonth {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void set(DateTime time) {
    state = DateTime.utc(time.year, time.month, time.day);
  }
}

@riverpod
CacheService calendarCacheService(Ref ref) {
  throw UnimplementedError();
}

@riverpod
CalendarApi calendarApi(Ref ref) {
  return MockCalendarApi();
}

@riverpod
CalendarRepository calendarRepository(Ref ref) {
  // The generator appends 'Provider' to your function names automatically
  final api = ref.watch(calendarApiProvider);
  final cacheService = ref.watch(
    calendarCacheServiceProvider,
  ); // Fixed typo from 'Provide'

  return CalendarRepository(api: api, cacheService: cacheService);
}

@riverpod
Future<EventsMapList> calendarEvents(Ref ref) {
  final repo = ref.watch(calendarRepositoryProvider);
  return repo.getEvents();
}

@riverpod
Future<Map<DateTime, List<Event>>> monthlyEventsMap(Ref ref) async {
  final allEvents = await ref.watch(calendarEventsProvider.future);
  final seclectedMonth = ref.watch(selectedMonthProvider);

  return LinkedHashMap.fromEntries(
    allEvents.entries.where(
      (entry) =>
          entry.key.year == seclectedMonth.year &&
          entry.key.month == seclectedMonth.month,
    ),
  );
}

@riverpod
Future<List<MapEntry<DateTime, List<Event>>>> monthlyEvents(
  Ref ref,
) async {
  final allEvents = await ref.watch(monthlyEventsMapProvider.future);
  return allEvents.entries.toList();
}

@riverpod
Future<List<Event>> monthlyEventsList(Ref ref) async {
  final monthlyEventsMap = await ref.watch(monthlyEventsMapProvider.future);
  return monthlyEventsMap.values.expand((eventsList) => eventsList).toList();
}
