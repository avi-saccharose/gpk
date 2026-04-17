import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';

class RoutineRepository {
  final CacheService cacheService;
  final ApiServer apiServer;
  Future<Map<Day, List<TimelineItem>>> fetchRoutine({
    required Branch branch,
    required int semester,
  }) async {
    final String cacheKey = "${branch.code}$semester";
    final cachedRoutine = cacheService.get(
      cacheKey,
    );
    if (cachedRoutine != null) return cachedRoutine.scheduleMap;
    try {
      final dynamic responseData = await apiServer.fetch(
        "/routine/${branch.code}/$semester",
      );

      final routineMap = {
        for (final entry in responseData.entries)
          Day.values.byName(entry.key): (entry.value as List)
              .map(
                (item) => TimelineItem.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
      };

      cacheService.write(cacheKey, RoutineSchedule(routineMap));

      return routineMap;
    } catch (E) {
      rethrow;
    }
  }

  RoutineRepository(this.cacheService, this.apiServer);
}
