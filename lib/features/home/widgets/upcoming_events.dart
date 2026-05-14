import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/widgets/error_card.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/home/providers/home_providers.dart';
import 'package:hugeicons/hugeicons.dart';

class UpcomingEvents extends ConsumerWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final events = ref.watch(upcomingEventsMapProvider);
    return events.when(
      data: (data) {
        return data.isEmpty
            ? Card(
                elevation: 2,
                shadowColor: Colors.black.withValues(alpha: 0.2),
                surfaceTintColor: Colors.transparent,
                color: colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p24),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedCalendar01,
                          size: 40,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                        gapH12,
                        Text(
                          'No Upcoming Events',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : EventsList(eventsMap: data);
      },
      loading: () {
        return const Padding(
          padding: EdgeInsetsGeometry.only(top: 24),
          child: Center(
            child: ElasticWaveLoader(),
          ),
        );
      },
      error: (error, stackTrace) {
        Log.error('montlhy events', error, stackTrace);
        return ErrorCard(
          message: 'Failed loading events',
          retry: () {
            ref.invalidate(upcomingEventsMapProvider);
          },
        );
      },
    );
  }
}

class EventsList extends StatelessWidget {
  final Map<DateTime, List<Event>> eventsMap;
  const EventsList({
    super.key,
    required this.eventsMap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final events = eventsMap.values.first;
    final date = eventsMap.keys.first;
    return Column(
      children: events.map((event) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Card(
            elevation: 2,
            shadowColor: Colors.black.withValues(alpha: 0.2),
            surfaceTintColor: Colors.transparent,
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedCalendar02,
                  color: colorScheme.primary,
                ),
              ),
              title: Text(
                event.title,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                date.dayMonth,
                style: textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
