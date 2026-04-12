import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:gpk_app/features/calendar/widgets/events_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends ConsumerWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(calendarEventsProvider);

    // we cannot check for errors with this method
    final eventsMap = events.value;
    List<Event> getEventsForDay(DateTime day) {
      return eventsMap?[day] ?? [];
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.p16),
      ),
      child: TableCalendar(
        focusedDay: DateTime.now(),
        onDaySelected: (selectedDay, _) {
          final events = getEventsForDay(selectedDay);
          if (events.isNotEmpty) {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => EventsBottomSheet(
                events: events,
                date: selectedDay,
              ),
            );
          }
          //showEventSheet(context, selectedDay, events);
        },
        onPageChanged: (newFocusedDay) {
          ref.read(selectedMonthProvider.notifier).set(newFocusedDay);
        },
        firstDay: DateTime.utc(2025, 05, 01),
        lastDay: DateTime.utc(2027, 05, 31),
        eventLoader: getEventsForDay,

        calendarBuilders: CalendarBuilders<Event>(
          markerBuilder: (context, date, events) {
            if (events.isEmpty) return const SizedBox();

            return Positioned(
              bottom: 8.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: events.map((event) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: event.group.color,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
        // styles
        calendarStyle: CalendarStyle(
          // tableBorder: TableBorder(
          //   horizontalInside: BorderSide(
          //     color: Colors.grey,
          //     width: 0.5,
          //   ),
          // top: BorderSide(color: Colors.black12, width: 1.0),
          // bottom: BorderSide(color: Colors.black12, width: 1.0),
          // left: BorderSide(color: Colors.black12, width: 1.0),
          // right: BorderSide(color: Colors.black12, width: 1.0),
          //  )//dev/, color: Colors.grey.shade300, // Light grey border
          //width: 1.0, // Thickness of the line
          // style: BorderStyle.solid,
          // ),
          defaultTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          outsideTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          // markerDecoration: BoxDecoration(
          //   color: Colors.redAccent,
          //   shape: BoxShape.circle,
          // ),
          // markerSize: 6,
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),

          // cellPadding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          headerMargin: const EdgeInsets.only(bottom: 8.0),
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
      ),
    );
  }
}
