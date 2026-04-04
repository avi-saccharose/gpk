import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/routine/data/mock_routine_repository.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/providers/clock_provider.dart';

final routineProvider = Provider<List<TimelineItem>>(
  (ref) => MockRoutineRepository.instance.getRoutine(),
);

final activeRoutineIndexProvider = Provider<int?>((ref) {
  final routine = ref.watch(routineProvider);
  final now = ref.watch(minutesNowProvider).value ?? 0;
  for (int i = 0; i < routine.length; i++) {
    final item = routine[i];
    if (now <= item.endTime) {
      return i;
    }
  }
  return null;
});
