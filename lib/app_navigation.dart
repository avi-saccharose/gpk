import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/app_shell_scaffold.dart';
import 'package:gpk_app/features/calendar/ui/calendar_screen.dart';
import 'package:gpk_app/features/home/ui/home_screen.dart';
import 'package:gpk_app/features/routine/ui/routine_screen.dart';
import 'package:gpk_app/features/settings/ui/settings_screen.dart';
import 'package:gpk_app/features/syllabus/ui/syllabus_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: "Home",
  );
  static final _shellNavigatorCalendarKey = GlobalKey<NavigatorState>(
    debugLabel: "Calendar",
  );
  static final _shellNavigatorRoutineKey = GlobalKey<NavigatorState>(
    debugLabel: "Routine",
  );
  static final _shellNavigatorSyllabusKey = GlobalKey<NavigatorState>(
    debugLabel: "Syllabus",
  );
  static final _shellNavigatorFacultyKey = GlobalKey<NavigatorState>(
    debugLabel: "Faculty",
  );

  static const home = '/home';
  static const routine = '/routine';
  static const calendar = '/calendar';
  static const faculty = '/faculty';
  static const syllabus = '/syllabus';
  static const subject = '/subject';
  static const setting = '/setting';

  static final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShellScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(path: home, builder: (context, state) => HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCalendarKey,
            routes: [
              GoRoute(
                path: calendar,
                builder: (context, state) => CalendarScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRoutineKey,
            routes: [
              GoRoute(
                path: routine,
                builder: (context, state) => RoutineScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSyllabusKey,
            routes: [
              GoRoute(
                path: syllabus,
                builder: (context, state) => SyllabusScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorFacultyKey,
            routes: [
              GoRoute(
                path: faculty,
                builder: (context, state) => Placeholder(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: setting,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => SettingsScreen(),
      ),
    ],
  );
}
