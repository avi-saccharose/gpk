import 'package:flutter/material.dart';
import 'package:gpk_app/constants/app_sizes.dart';
import 'package:gpk_app/core/widgets/date_today.dart';
import 'package:gpk_app/features/routine/widgets/date_picker.dart';
import 'package:gpk_app/features/routine/widgets/timeline.dart';

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
            DateToday(),
            gapH20,
            DatePicker(),
            gapH20,
            Timeline(),
          ],
        ),
      ),
    );
  }
}
