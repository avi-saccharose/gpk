import 'dart:collection';
import 'package:flutter/material.dart';

typedef EventsMapList = LinkedHashMap<DateTime, List<Event>>;

class Event {
  final String title;
  final EventGroup group;
  Event({required this.title, this.group = EventGroup.all});

  @override
  String toString() => title.toString();
}

enum EventGroup {
  all,
  cse1,
  cse2,
  cse3,
  ce1,
  ce2,
  ce3,

  ct1,
  ct2,
  ct3,
}

extension EventGroupColor on EventGroup {
  Color get color {
    switch (this) {
      case EventGroup.cse1:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
