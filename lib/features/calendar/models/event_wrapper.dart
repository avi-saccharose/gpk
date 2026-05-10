import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

// Wrapper class for storing in cache
class EventWrapper {
  final Map<DateTime, List<Event>> eventsMap;
  EventWrapper(this.eventsMap);

  EventsMapList get events {
    final eventsHashMap = EventsMapList(
      equals: (a, b) => a.isSameDay(b),
      hashCode: (key) => key.year * 10000 + key.month * 100 + key.day,
    );

    eventsHashMap.addAll(eventsMap);
    return eventsHashMap;
  }
}
