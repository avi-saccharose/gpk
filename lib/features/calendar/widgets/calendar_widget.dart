import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends ConsumerWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(calendarEventsProvider);
    final eventsMap = events.value;

    List<Event> getEventsForDay(DateTime day) {
      return eventsMap?[day] ?? [];
    }

    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2025, 05, 01),
      lastDay: DateTime.utc(2027, 05, 31),
      eventLoader: getEventsForDay,
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        outsideTextStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        markerDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),

      daysOfWeekHeight: 30,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        weekendStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
