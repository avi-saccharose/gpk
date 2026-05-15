import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/widgets/error_card.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:gpk_app/features/calendar/widgets/event_list_item.dart';

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
            'no events',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          );
        }
        return Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(monthlyEventsProvider);
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
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
                      (event) => EventListItem(
                        event: event,
                      ),
                    ), //.toList(),
                  ],
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: ElasticWaveLoader()),
      error: (error, stackTrace) {
        Log.error('Fetching calendar failed', error, stackTrace);
        return ErrorCard(
          message: 'Failed fetching calendar events',
          retry: () {
            ref.invalidate(calendarEventsProvider);
          },
        );
      },
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
