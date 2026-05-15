import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/app_theme.dart';
import 'package:gpk_app/core/cache/cache_metadata.dart';
import 'package:gpk_app/core/cache/cache_metadata_provider.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/core/constants/app_config.dart';
import 'package:gpk_app/core/models/user_preferences.dart';
import 'package:gpk_app/core/network/api_provider.dart';
import 'package:gpk_app/core/network/api_server.dart';
import 'package:gpk_app/features/calendar/models/event_wrapper.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/providers/routine_providers.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';
import 'package:gpk_app/features/syllabus/providers/syllabus_providers.dart';
import 'package:gpk_app/hive/hive_registrar.g.dart';
import 'package:gpk_app/routing/app_router.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.init();
  await Hive.initFlutter();
  Hive.registerAdapters();

  final calendarCacheService = CacheService<EventWrapper>('calendarBox');
  final routineCacheService = CacheService<RoutineSchedule>('routineBox');
  final settingsCacheService = CacheService<UserPreferences>('userBox');
  final syllabusCacheService = CacheService<Syllabus>('syllabusBox');
  final cacheMetaDataService = CacheMetadata('cacheMetadata');

  //final apiServer = ApiServer(baseUrl: 'http://localhost:8787');
  final apiServer = ApiServer(
    baseUrl: 'https://gpk-backend.avi-vivi.workers.dev',
  );
  await cacheMetaDataService.init();
  await calendarCacheService.init();
  await routineCacheService.init();
  await settingsCacheService.init();
  await syllabusCacheService.init();

  //WARN: Remove during production
  // await routineCacheService.clearAll();
  // await calendarCacheService.clearAll();
  // await settingsCacheService.clearAll();
  // await syllabusCacheService.clearAll();

  runApp(
    ProviderScope(
      overrides: [
        apiClientProvider.overrideWithValue(apiServer),
        cacheMetadataProvider.overrideWithValue(cacheMetaDataService),
        calendarCacheServiceProvider.overrideWithValue(calendarCacheService),
        routineCacheServiceProvider.overrideWithValue(routineCacheService),
        settingsCacheServiceProvider.overrideWithValue(settingsCacheService),
        sylllabusCacheServiceProvider.overrideWithValue(syllabusCacheService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      // theme: ThemeData(
      //   fontFamily: 'Inter',
      //   actionIconTheme: ActionIconThemeData(
      //     backButtonIconBuilder: (BuildContext context) =>
      //         const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02),
      //   ),
      //   useMaterial3: true,
      //   colorSchemeSeed: Colors.white,
      // ),
      routerConfig: router,
    );
  }
}
