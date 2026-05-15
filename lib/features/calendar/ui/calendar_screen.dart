import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/calendar/widgets/calendar_widget.dart';
import 'package:gpk_app/features/calendar/widgets/event_list.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBranch = ref.watch(settingsProvider).selectedBranch;
    final selectedSemester = ref.watch(settingsProvider).selectedSemester;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              'Calendar',
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '$selectedBranch $selectedSemester',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            gapH20,
            const CalendarWidget(),
            gapH20,
            const Text(
              'Events',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            gapH16,
            const EventList(),
          ],
        ),
      ),
      // ),
    );
  }
}
