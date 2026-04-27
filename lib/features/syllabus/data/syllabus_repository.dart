import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/network/api_server.dart';

class SyllabusRepository {
  final CacheService cacheService;
  final ApiServer apiServer;

  SyllabusRepository(this.cacheService, this.apiServer);
}
