import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/app_navigation.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/models/user_preferences.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/providers/routine_providers.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/hive/hive_registrar.g.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  final calendarCacheService = CacheService<EventsMapList>("calendarBox");
  final routineCacheService = CacheService<RoutineSchedule>(
    "routineBox",
  );

  final settingsCacheService = CacheService<UserPreferences>("userBox");

  await calendarCacheService.init();
  await routineCacheService.init();
  await settingsCacheService.init();

  //WARN: Remove during production
  await routineCacheService.clearAll();
  await calendarCacheService.clearAll();
  await settingsCacheService.clearAll();

  runApp(
    ProviderScope(
      overrides: [
        calendarCacheServiceProvider.overrideWithValue(calendarCacheService),
        routineCacheServiceProvider.overrideWithValue(routineCacheService),
        settingsCacheServiceProvider.overrideWithValue(settingsCacheService),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp(
      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
      ),
      home: AppNavigation(),
    );
  }
}
