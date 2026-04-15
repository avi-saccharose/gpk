import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/core/providers/routine_providers.dart';
import 'package:gpk_app/core/utils/time_helper.dart';
import 'package:gpk_app/features/routine/providers/routine_providers.dart';

class Timeline extends ConsumerWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = ref.watch(routineProvider);
    final activeIndex = ref.watch(activeRoutineIndexProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: routine.length,
        itemBuilder: (context, index) {
          final isLast = index == (routine.length - 1);
          final isActive = index == activeIndex;

          return TimelineTile(
            item: routine[index],
            isLast: isLast,
            isActive: isActive,
          );
        },
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final TimelineItem item;
  final bool isLast;
  final bool isActive;
  const TimelineTile({
    super.key,
    required this.item,
    this.isLast = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                displayTime(item.startTime),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),

              Text(
                displayTime(item.endTime),
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          gapW8,
          Column(
            children: [
              Container(
                width: Sizes.p12,
                height: Sizes.p12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.primary, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: colorScheme.primary.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: Sizes.p20),
              padding: const EdgeInsets.all(Sizes.p16),
              decoration: BoxDecoration(
                color: isActive
                    ? colorScheme.primary
                    : colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(Sizes.p16),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.red.withValues(alpha: 0.09),
                //     blurRadius: 10,
                //     offset: const Offset(0, 4),
                //   ),
                //],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: Sizes.p24,
                        height: Sizes.p24,
                        image: AssetImage(item.iconUrl),
                      ),
                      gapW12,
                      Text(
                        item.subjectName,
                        style: TextStyle(
                          color: isActive
                              ? colorScheme.onPrimary
                              : colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        item.subjectID ?? "",
                        style: textTheme.labelSmall?.copyWith(
                          color:
                              (isActive
                                      ? colorScheme.primary
                                      : colorScheme.onPrimaryContainer)
                                  .withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                  gapH8,
                  Text(
                    item.instructorName ?? "",
                    style: TextStyle(
                      color:
                          (isActive
                                  ? colorScheme.onPrimary
                                  : colorScheme.onPrimaryContainer)
                              .withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
