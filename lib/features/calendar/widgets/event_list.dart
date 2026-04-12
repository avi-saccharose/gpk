import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/widgets/sub_heading.dart';
import 'package:gpk_app/core/widgets/subtitle_text.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:intl/intl.dart';

class EventList extends ConsumerWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final montlyEvents = ref.watch(monthlyEventsProvider);
    return montlyEvents.when(
      data: (eventsList) {
        // final eventsList = eventsMap.entries.toList();
        if (eventsList.isEmpty) return SubtitleText(text: "no events");
        return Expanded(
          child: ListView.builder(
            itemCount: eventsList.length,
            itemBuilder: (context, index) {
              final date = eventsList[index].key;
              final entries = eventsList[index].value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventListDate(date: date),
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
  const EventListDate({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final formattedDate = DateFormat.MMMMd().format(date);
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          gapW8,
          Text(
            formattedDate,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
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
    return Card(
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
    // return Container(
    //   margin: EdgeInsetsGeometry.symmetric(vertical: Sizes.p4),
    //   padding: EdgeInsetsGeometry.symmetric(
    //     vertical: Sizes.p8,
    //     horizontal: Sizes.p4,
    //   ),
    //   decoration: BoxDecoration(
    //     color: Colors.red,
    //     borderRadius: BorderRadius.circular(Sizes.p8),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(title),
    //       gapH8,
    //       Text(description),
    //     ],
    //   ),
    // );
  }
}
