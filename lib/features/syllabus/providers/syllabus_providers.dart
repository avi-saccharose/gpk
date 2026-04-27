import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/providers/api_providers.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/features/syllabus/data/syllabus_repository.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syllabus_providers.g.dart';

@riverpod
CacheService sylllabusCacheService(Ref ref) {
  throw UnimplementedError();
}

@riverpod
SyllabusRepository syllabusRepository(Ref ref) {
  final cacheService = ref.watch(sylllabusCacheServiceProvider);
  final apiServer = ref.watch(apiClientProvider);
  return SyllabusRepository(cacheService, apiServer);
}

@riverpod
Future<Syllabus> syllabus(Ref ref) async {
  final repository = ref.watch(syllabusRepositoryProvider);
  final branch = ref.watch(settingsProvider).selectedBranch;
  final semester = ref.watch(settingsProvider).selectedSemester;
  final syllabus = await repository.fetchSyllabus(
    branch: branch,
    semester: semester,
  );
  return syllabus;
}
