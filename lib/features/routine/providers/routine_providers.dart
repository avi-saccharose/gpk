import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/core/providers/api_providers.dart';
import 'package:gpk_app/features/routine/data/routine_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routine_providers.g.dart';

@Riverpod(name: 'selectedDayProvider')
class DateNotifier extends _$DateNotifier {
  @override
  DateTime build() => DateTime.now().normalize();
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
