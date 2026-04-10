import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/calendar/widgets/calendar_widget.dart';
import 'package:gpk_app/features/calendar/widgets/event_list.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH20,
              CalendarWidget(),
              gapH20,
              Text(
                'Events',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              gapH16,
              EventList(),
              Text('list'),
            ],
          ),
        ),
      ),
    );
  }
}
