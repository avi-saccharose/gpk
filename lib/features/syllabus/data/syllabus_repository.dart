import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';

class SyllabusRepository {
  final CacheService cacheService;
  final ApiServer apiServer;

  SyllabusRepository(this.cacheService, this.apiServer);

  Future<Syllabus> fetchSyllabus({
    required Branch branch,
    required int semester,
  }) async {
    final cacheKey = "${branch.code}$semester";
    final cachedSyllabus = cacheService.get(cacheKey);

    if (cachedSyllabus != null) return cachedSyllabus;

    try {
      final dynamic response = await apiServer.fetch(
        "/syllabus/$branch/$semester",
      );
      final syllabus = Syllabus.fromJson(response as Map<String, dynamic>);
      cacheService.write(cacheKey, syllabus);
      return syllabus;
    } catch (E) {
      Log.error("Fetching syllabus error for $branch $semester");
      rethrow;
    }
  }
}
