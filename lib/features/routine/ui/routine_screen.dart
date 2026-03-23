import 'package:flutter/material.dart';
import 'package:gpk_app/constants/app_sizes.dart';
import 'package:gpk_app/features/routine/widgets/date_picker.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              "May 5 2020",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              'Today',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            gapH20,
            DatePicker(),
          ],
        ),
      ),
    );
  }
}
