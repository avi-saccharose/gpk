import 'package:gpk_app/features/calendar/data/calendar_api.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

class CalendarRepository {
  final CalendarApi api;
  CalendarRepository(this.api);

  Future<EventsMapList> getEvents() async {
    final events = await api.fetchEvents();
    return events;
  }
}
