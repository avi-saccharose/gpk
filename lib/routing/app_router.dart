import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/app_shell_scaffold.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/calendar/ui/calendar_screen.dart';
import 'package:gpk_app/features/faculty/ui/faculty_screen.dart';
import 'package:gpk_app/features/home/ui/home_screen.dart';
import 'package:gpk_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:gpk_app/features/routine/ui/routine_screen.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/features/settings/ui/settings_screen.dart';
import 'package:gpk_app/features/syllabus/ui/syllabus_screen.dart';
import 'package:gpk_app/features/syllabus/widgets/syllabus_detail_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: "Home");
final shellNavigatorCalendarKey = GlobalKey<NavigatorState>(
  debugLabel: "Calendar",
);
final shellNavigatorRoutineKey = GlobalKey<NavigatorState>(
  debugLabel: "Routine",
);
final shellNavigatorSyllabusKey = GlobalKey<NavigatorState>(
  debugLabel: "Syllabus",
);
final shellNavigatorFacultyKey = GlobalKey<NavigatorState>(
  debugLabel: "Faculty",
);

class AppRoutes {
  static const onBoarding = '/onBoarding';
  static const home = '/home';
  static const routine = '/routine';
  static const calendar = '/calendar';
  static const faculty = '/faculty';
  static const syllabus = '/syllabus';
  static const subject = '/subject';
  static const setting = '/setting';
}

@riverpod
GoRouter router(Ref ref) {
  final onboarding = ref.watch(settingsProvider);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    redirect: (context, state) {
      final bool completed = onboarding.completedOnboarding;
      Log.info("completedOnboarding: $completed");
      if (!completed) {
        return AppRoutes.onBoarding;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShellScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCalendarKey,
            routes: [
              GoRoute(
                path: AppRoutes.calendar,
                builder: (context, state) => const CalendarScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorRoutineKey,
            routes: [
              GoRoute(
                path: AppRoutes.routine,
                builder: (context, state) => const RoutineScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorSyllabusKey,
            routes: [
              GoRoute(
                path: AppRoutes.syllabus,
                builder: (context, state) => const SyllabusScreen(),
                routes: [
                  GoRoute(
                    path: ':subjectCode',
                    builder: (context, state) {
                      // WARN: handle invalid state
                      final subjectCode = state.pathParameters['subjectCode']!;
                      return SyllabusDetailScreen(subjectCode: subjectCode);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorFacultyKey,
            routes: [
              GoRoute(
                path: AppRoutes.faculty,
                builder: (context, state) => const FacultyScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.setting,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
