import 'package:gpk_app/core/cache/cache_metadata.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';

class RoutineRepository {
  final CacheService cacheService;
  final CacheMetadata cacheMetadata;
  final ApiServer apiServer;

  Future<Map<Day, List<TimelineItem>>> fetchRoutine({
    required Branch branch,
    required Semester semester,
  }) async {
    final String cacheKey = '${branch.code}$semester';
    const String timeStampKey = 'routine';

    if (cacheMetadata.isCacheValid(timeStampKey, const Duration(days: 1))) {
      final cachedRoutine = cacheService.get(
        cacheKey,
      );
      if (cachedRoutine != null) {
        Log.info(
          'Routine: Returning cache',
        );
        return cachedRoutine.scheduleMap;
      }
    }

    try {
      final dynamic responseData = await apiServer.fetch(
        '/routine/$branch/$semester',
      );

      final routineMap = {
        for (final entry in responseData.entries)
          Day.values.byName(entry.key): (entry.value as List)
              .map(
                (item) => TimelineItem.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
      };

      await cacheService.write(cacheKey, RoutineSchedule(routineMap));
      await cacheMetadata.updateCacheTimeStamp(timeStampKey);

      return routineMap;
    } catch (E) {
      rethrow;
    }
  }

  RoutineRepository(this.cacheService, this.cacheMetadata, this.apiServer);
}
