import 'dart:collection';

typedef EventsMapList = LinkedHashMap<DateTime, List<Event>>;

class Event {
  final String title;
  Event({required this.title});

  @override
  String toString() => title.toString();
}
