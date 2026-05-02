import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/widgets/subtitle_text.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';

class EventList extends ConsumerWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final montlyEvents = ref.watch(monthlyEventsProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return montlyEvents.when(
      data: (eventsList) {
        // final eventsList = eventsMap.entries.toList();
        if (eventsList.isEmpty) {
          return Text(
            "no events",
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: eventsList.length,
            itemBuilder: (context, index) {
              final date = eventsList[index].key;
              final isToday = date.isToday;
              final entries = eventsList[index].value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventListDate(date: date, isToday: isToday),
                  ...entries.map(
                    (e) => EventListItem(
                      title: e.title,
                      description: e.description,
                    ),
                  ), //.toList(),
                ],
              );
            },
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => SubtitleText(text: "error fecthing data"),
    );
  }
}

class EventListDate extends StatelessWidget {
  final DateTime date;
  final bool isToday;
  const EventListDate({
    super.key,
    required this.date,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          gapW8,
          Text(
            date.monthDate,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isToday ? colorScheme.primary : colorScheme.secondary,
            ),
          ),
          gapW8,
          Expanded(
            child: Divider(
              color: colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class EventListItem extends StatelessWidget {
  final String title;
  final String description;
  const EventListItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsetsGeometry.symmetric(
        vertical: Sizes.p8,
        horizontal: Sizes.p16,
      ),
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
      // color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            gapH8,
            Text(
              description,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
