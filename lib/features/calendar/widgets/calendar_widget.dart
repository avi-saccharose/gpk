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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final events = ref.watch(calendarEventsProvider);

    // we cannot check for errors with this method
    final eventsMap = events.value;
    List<Event> getEventsForDay(DateTime day) {
      return eventsMap?[day] ?? [];
    }

    return Container(
      margin: EdgeInsets.all(Sizes.p16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(Sizes.p16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      //color: colorScheme.surfaceContainerLow,
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
        lastDay: DateTime.utc(2050, 05, 31),
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
          defaultTextStyle: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurface,
            fontSize: textTheme.bodyLarge?.fontSize ?? 16,
          ),

          outsideTextStyle: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            fontSize: textTheme.bodyLarge?.fontSize ?? 16,
          ),
          todayDecoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
            ),
          ),
          headerMargin: const EdgeInsets.only(bottom: 8.0),
        ),

        daysOfWeekHeight: 30,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: textTheme.labelLarge?.fontSize ?? 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          weekendStyle: TextStyle(
            fontSize: textTheme.labelLarge?.fontSize ?? 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
