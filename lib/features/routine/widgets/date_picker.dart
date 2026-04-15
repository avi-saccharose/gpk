import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/utils/time_helper.dart';
import 'package:gpk_app/features/routine/providers/routine_providers.dart';

class DatePicker extends ConsumerWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final dates = getDaysListInMonth(selectedDay.year, selectedDay.month);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const itemWidth = 55.0;

    final scrollController = ScrollController(
      initialScrollOffset: selectedDay.day * itemWidth,
    );

    final routineRepository = ref.watch(routineRepositoryProvider);
    return SizedBox(
      height: Sizes.p80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isWeekend = date.isWeekend;
          final bool isSelected = date.isSameDay(selectedDay);

          final Color color = isWeekend
              ? colorScheme.onSurface.withValues(alpha: 0.6)
              : isSelected
              ? colorScheme.primary
              : colorScheme.outline;

          return GestureDetector(
            onTap: () => {
              routineRepository.fetchRoutine(branch: Branch.cse, semester: 1),
              if (!isWeekend)
                ref.read(selectedDayProvider.notifier).update(date),
            },
            child: Container(
              width: 55,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                // color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text(
                    date.shortDay,
                    style: textTheme.labelLarge?.copyWith(color: color),
                  ),
                  gapH8,
                  Text(
                    date.dayNum,
                    style: textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  gapH4,
                  Container(
                    width: Sizes.p4,
                    height: Sizes.p4,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.primary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
