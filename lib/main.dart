import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/app_navigation.dart';
import 'package:gpk_app/core/cache/cache_service.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/providers/routine_providers.dart';
import 'package:gpk_app/hive/hive_registrar.g.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  final calendarCacheService = CacheService<EventsMapList>("calendarBox");
  final routineCacheService = CacheService<RoutineSchedule>(
    "routineBox",
  );
  await calendarCacheService.init();
  await routineCacheService.init();

  await routineCacheService.clearAll();

  runApp(
    ProviderScope(
      overrides: [
        calendarCacheServiceProvider.overrideWithValue(calendarCacheService),
        routineCacheServiceProvider.overrideWithValue(routineCacheService),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
      ),
      home: AppNavigation(),
    );
  }
}
