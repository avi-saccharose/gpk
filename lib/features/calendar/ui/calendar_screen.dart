import 'package:flutter/material.dart';
import 'package:gpk_app/features/calendar/widgets/calendar_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CalendarWidget(),
    );
  }
}
