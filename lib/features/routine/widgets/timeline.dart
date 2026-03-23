import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/constants/app_sizes.dart';
import 'package:gpk_app/features/routine/data/mock_routine_repository.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/features/routine/providers/clock_provider.dart';
import 'package:gpk_app/utils/time_helper.dart';

class Timeline extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = MockRoutineRepository.instance.getRoutine();
    final now = ref.watch(minutesNowProvider).value ?? 0;
    return Expanded(
      child: ListView.builder(
        itemCount: routine.length,
        itemBuilder: (context, index) {
          final isLast = index == (routine.length - 1);
          final item = routine[index];
          bool isActive = false;

          if (now >= item.startTime) {
            if (isLast) {
              isActive = now < item.endTime;
            } else if (now < routine[index + 1].startTime) {
              isActive = true;
            }
          }

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
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                displayTime(item.startTime),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              Text(
                displayTime(item.endTime),
                style: const TextStyle(
                  fontSize: 14,
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
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.blue.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: Sizes.p20),
              padding: const EdgeInsets.all(Sizes.p16),
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(Sizes.p16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.09),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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
                        image: AssetImage('assets/icons/c-programming-64.png'),
                      ),
                      gapW12,
                      Text(
                        item.subjectName,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        item.subjectID ?? "",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  gapH8,
                  Text(
                    item.instructorName ?? "",
                    style: const TextStyle(color: Colors.grey),
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
