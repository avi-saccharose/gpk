import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/user_preferences.dart';

class SettingsRepository {
  final CacheService cacheService;
  final String cacheKey = 'userPreferences';

  SettingsRepository(this.cacheService);

  UserPreferences get userPreferences =>
      cacheService.get(cacheKey) ?? UserPreferences();

  bool get isDarkMode => userPreferences.isDarkMode;
  Branch get selectedBranch => userPreferences.selectedBranch;
  int get selectedSemester => userPreferences.selectedSemester;

  Future<UserPreferences> updateTheme(bool isDarkMode) async {
    final preferences = userPreferences.copyWith(isDarkMode: isDarkMode);
    await cacheService.write(cacheKey, preferences);
    return preferences;
  }

  Future<UserPreferences> updateBranch(Branch branch) async {
    final preferences = userPreferences.copyWith(selectedBranch: branch);
    await cacheService.write(cacheKey, preferences);
    return preferences;
  }

  Future<UserPreferences> updateSemester(int semester) async {
    final preferences = userPreferences.copyWith(selectedSemester: semester);
    await cacheService.write(cacheKey, preferences);
    return preferences;
  }
}
