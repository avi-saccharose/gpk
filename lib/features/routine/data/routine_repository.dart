import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';

class RoutineRepository {
  final CacheService cacheService;
  final ApiServer apiServer;
  Future<Map<Day, TimelineItem>?> fetchRoutine({
    required Branch branch,
    required int semester,
  }) async {
    final cachedRoutine = cacheService.get("${branch.code}$semester");
    if (cachedRoutine != null) return cachedRoutine;
    try {
      final dynamic responseData = await apiServer.fetch(
        "/routine/$branch/$semester",
      );
      print(responseData);
      return null;
    } catch (E) {
      rethrow;
    }
  }

  RoutineRepository(this.cacheService, this.apiServer);
}
