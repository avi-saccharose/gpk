import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/widgets/event_list_item.dart';

class EventsBottomSheet extends StatelessWidget {
  final List<Event> events;
  final DateTime date;
  const EventsBottomSheet({
    super.key,
    required this.events,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 800,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsetsGeometry.only(
                top: Sizes.p12,
                bottom: Sizes.p12,
              ),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.onSurface,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Events',
                  style: textTheme.headlineSmall,
                ),
                gapH4,
                Text(
                  date.shortDate,
                  style: textTheme.titleMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
                gapH12,
                for (var event in events)
                  SizedBox(
                    width: double.infinity,
                    child: EventListItem(event: event),
                  ),
                // BottomSheetItem(
                //   title: event.title,
                //   description: event.description,
                //   group: event.group,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
