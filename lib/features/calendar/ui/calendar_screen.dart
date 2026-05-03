import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:gpk_app/features/calendar/widgets/calendar_widget.dart';
import 'package:gpk_app/features/calendar/widgets/event_list.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBranch = ref.watch(settingsProvider).selectedBranch;
    final selectedSemester = ref.watch(settingsProvider).selectedSemester;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text("Calendar", style: AppTextStyles.label),
            Text(
              "$selectedBranch $selectedSemester",
              style: AppTextStyles.display,
            ),
            gapH20,
            CalendarWidget(),
            gapH20,
            Text(
              'Events',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            gapH16,
            EventList(),
          ],
        ),
      ),
      // ),
    );
  }
}
