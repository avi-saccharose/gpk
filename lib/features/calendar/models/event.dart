import 'dart:collection';
import 'package:flutter/material.dart';

typedef EventsMapList = LinkedHashMap<DateTime, List<Event>>;

class Event {
  final String title;
  final String description;
  final EventGroup group;
  Event({
    required this.title,
    this.description = "",
    this.group = EventGroup.all,
  });

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

  ft1,
  ft2,
  ft3
  ;

  String get display {
    switch (this) {
      case EventGroup.cse1:
      case EventGroup.cse2:
      case EventGroup.cse3:
        return "cse";
      case EventGroup.ce1:
      case EventGroup.ce2:
      case EventGroup.ce3:
        return "ce";
      case EventGroup.ft1:
      case EventGroup.ft2:
      case EventGroup.ft3:
        return "ft";
      default:
        return "gpk";
    }
  }

  Color get color {
    switch (this) {
      case EventGroup.cse1:
      case EventGroup.cse2:
      case EventGroup.cse3:
        return Colors.red;
      case EventGroup.ce1:
      case EventGroup.ce2:
      case EventGroup.ce3:
        return Colors.blue;
      case EventGroup.ft1:
      case EventGroup.ft2:
      case EventGroup.ft3:
        return Colors.pink;
      default:
        return Colors.green;
    }
  }
}
