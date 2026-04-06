import 'package:gpk_app/features/calendar/data/calendar_api.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

// Class for handling api requests
class MockCalendarApi implements CalendarApi {
  //static const String calendarId = String.fromEnvironment('CALENDAR_ID');
  //static const String apiKey = String.fromEnvironment("CALENDAR_API_KEY");

  @override
  Future<EventsMapList> fetchEvents() async {
    final source = {
      DateTime.now(): [
        Event(title: "Event 1"),
        Event(title: "Event 2"),
      ],
      DateTime.now().add(const Duration(days: 1)): [
        Event(title: "Event 1"),
        Event(title: "Event 2"),
      ],
    };

    final events = EventsMapList(
      equals: (a, b) {
        return a.year == b.year && a.month == b.month && a.day == b.day;
      },
      hashCode: (key) {
        return key.year * 10000 + key.month * 100 + key.day;
      },
    )..addAll(source);

    return events;
  }

  // @override
  // Future<EventsMapList> fetchEvents() async {
  //   final String url =
  //       'https://www.googleapis.com/calendar/v3/calendars/$calendarId/events'
  //       '?key=$apiKey';
  //
  //   try {
  //     final respone = await http.get(Uri.parse(url));
  //     print(respone.body);
  //   } catch (e) {
  //     print(e);
  //   }
  //   throw ('todo');
  // }
}
