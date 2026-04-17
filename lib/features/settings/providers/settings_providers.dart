import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/user_preferences.dart';
import 'package:gpk_app/features/settings/repository/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@riverpod
CacheService settingsCacheService(Ref ref) {
  throw UnimplementedError();
}

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final cacheService = ref.watch(settingsCacheServiceProvider);
  return SettingsRepository(cacheService);
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  late SettingsRepository _repository;

  @override
  UserPreferences build() {
    _repository = ref.watch(settingsRepositoryProvider);
    return _repository.userPreferences;
  }

  Future<void> updateTheme(bool isDarkMode) async {
    final preferences = await _repository.updateTheme(isDarkMode);
    state = preferences;
  }
}
