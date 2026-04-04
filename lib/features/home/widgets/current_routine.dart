import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/routine/widgets/timeline.dart';
import 'package:gpk_app/providers/routine_providers.dart';

class CurrentRoutine extends ConsumerWidget {
  const CurrentRoutine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(activeRoutineIndexProvider);
    final routine = ref.watch(routineProvider);

    if (activeIndex == null) {
      return const SizedBox.shrink();
    }
    final item = routine[activeIndex];
    final isLast = activeIndex == (routine.length - 1);
    return TimelineTile(item: item, isLast: isLast, isActive: true);
  }
}
