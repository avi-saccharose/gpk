import 'package:gpk_app/features/calendar/models/event.dart';

abstract class CalendarApi {
  Future<EventsMapList> fetchEvents();
}
