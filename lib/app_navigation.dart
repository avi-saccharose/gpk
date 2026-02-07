import 'package:flutter/material.dart';
import 'package:gpk_app/features/calendar/ui/calendar_screen.dart';
import 'package:gpk_app/features/routine/ui/routine_screen.dart';
import 'package:gpk_app/features/syllabus/ui/syllabus_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CalendarScreen(),
    RoutineScreen(),
    SyllabusScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),

          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: "Home",
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
    );
  }
}
