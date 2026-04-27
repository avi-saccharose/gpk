import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/providers/api_providers.dart';
import 'package:gpk_app/features/routine/data/routine_repository.dart';
import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routine_providers.g.dart';

@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  DateTime build() {
    // We skip weekends as we dont have routines for weekends
    var date = DateTime.now().normalize();
    if (date.weekday == DateTime.sunday) {
      date = date.add(Duration(days: 1));
    } else if (date.weekday == DateTime.saturday) {
      date = date.add(Duration(days: 2));
    }
    return date;
  }

  void update(DateTime newDate) => state = newDate.normalize();
}

@riverpod
CacheService routineCacheService(Ref ref) {
  throw UnimplementedError();
}

@riverpod
RoutineRepository routineRepository(Ref ref) {
  final cacheService = ref.watch(routineCacheServiceProvider);
  final apiServer = ref.watch(apiClientProvider);
  return RoutineRepository(cacheService, apiServer);
}

// WARN: Handle empty value
@riverpod
Future<List<TimelineItem>> routine(
  Ref ref,
) async {
  final repository = ref.watch(routineRepositoryProvider);
  final branch = ref.watch(settingsProvider).selectedBranch;
  final semester = ref.watch(settingsProvider).selectedSemester;
  final day = ref.watch(selectedDayProvider).toDay;
  final routines = await repository.fetchRoutine(
    branch: branch,
    semester: semester,
  );
  final routine = routines[day] ?? [];
  return routine;
}

@riverpod
Stream<void> minuteTicker(Ref ref) {
  return Stream.periodic(Duration(minutes: 1));
}
