import 'package:gpk_app/core/cache/cache_metadata.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';

class SyllabusRepository {
  final CacheService cacheService;
  final CacheMetadata cacheMetadata;
  final ApiServer apiServer;

  SyllabusRepository(this.cacheService, this.cacheMetadata, this.apiServer);

  Future<Syllabus> fetchSyllabus({
    required Branch branch,
    required Semester semester,
  }) async {
    final cacheKey = '${branch.code}$semester';
    const String timeStampKey = 'syllabus';

    if (cacheMetadata.isCacheValid(timeStampKey, const Duration(days: 1))) {
      final cachedSyllabus = cacheService.get(
        cacheKey,
      );
      if (cachedSyllabus != null) {
        Log.info(
          'Syllabus: Returning cache',
        );
        return cachedSyllabus;
      }
    }
    try {
      final dynamic response = await apiServer.fetch(
        '/syllabus/$branch/$semester',
      );
      final syllabus = Syllabus.fromJson(response as Map<String, dynamic>);
      await cacheService.write(cacheKey, syllabus);
      await cacheMetadata.updateCacheTimeStamp(timeStampKey);
      return syllabus;
    } catch (e) {
      Log.error('Fetching syllabus error for $branch $semester', e);
      rethrow;
    }
  }
}
