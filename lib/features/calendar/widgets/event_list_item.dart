import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

class EventListItem extends StatelessWidget {
  final Event event;
  const EventListItem({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final group = event.group;
    final color = group.color;
    return Container(
      margin: const EdgeInsetsGeometry.symmetric(
        vertical: Sizes.p8,
        horizontal: Sizes.p16,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: BoxBorder.all(color: colorScheme.outline),
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
                Container(
                  padding: const EdgeInsetsGeometry.symmetric(
                    vertical: Sizes.p4,
                    horizontal: Sizes.p8,
                  ),

                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: colorScheme.outline),
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(Sizes.p4),
                  ),
                  child: Text(
                    group.display,
                    style: TextStyle(color: color),
                  ),
                ),
                gapW8,
                Expanded(
                  child: Text(
                    event.title,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            gapH8,
            Text(
              event.description,
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
