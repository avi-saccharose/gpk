import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/extensions/date_time_extension.dart';
import 'package:gpk_app/features/routine/widgets/date_picker.dart';
import 'package:gpk_app/features/routine/widgets/timeline.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colorScheme = Theme.of(context).colorScheme;
    final date = DateTime.now().normalize();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              date.shortDate,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            Text(
              "Today",
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
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
