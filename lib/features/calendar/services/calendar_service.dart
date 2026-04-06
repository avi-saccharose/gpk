import 'package:http/http.dart' as http;

class CalendarService {
  static const String calendarId = String.fromEnvironment('CALENDAR_ID');
  static const String apiKey = String.fromEnvironment("CALENDAR_API_KEY");

  static void getEvents() async {
    final String url =
        'https://www.googleapis.com/calendar/v3/calendars/$calendarId/events'
        '?key=$apiKey';

    try {
      final respone = await http.get(Uri.parse(url));
      print(respone.body);
    } catch (e) {
      print(e);
    }
  }
}
