import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:hugeicons/styles/stroke_rounded.dart';

class AppShellScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppShellScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Sizes.p16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(Sizes.p32),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.p32),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            ),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome01,
                ), //Icon(Icons.home_outlined),
                label: "Home",
              ),

              BottomNavigationBarItem(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedCalendar02),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedTimelineList),
                label: "Routine",
              ),

              BottomNavigationBarItem(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedBooks02),
                label: "Syllabus",
              ),
              BottomNavigationBarItem(
                icon: HugeIcon(icon: HugeIconsStrokeRounded.bookUser),
                label: "Faculty",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
