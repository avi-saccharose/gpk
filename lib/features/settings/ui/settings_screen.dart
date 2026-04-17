import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsNotifier = ref.watch(settingsProvider);
    final selectedBranch = settingsNotifier.selectedBranch;
    final selectedSemester = settingsNotifier.selectedSemester;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(settingsNotifier.isDarkMode.toString()),
            Switch(
              value: settingsNotifier.isDarkMode,
              onChanged: (value) =>
                  ref.read(settingsProvider.notifier).updateTheme(value),
            ),
            SegmentedButton<Branch>(
              segments: [
                ButtonSegment(
                  value: Branch.cse,
                  label: Text("CSE"),
                ),
                ButtonSegment(
                  value: Branch.ce,
                  label: Text("CE"),
                ),
                ButtonSegment(
                  value: Branch.ft,
                  label: Text("FT"),
                ),
              ],
              selected: {selectedBranch},
              onSelectionChanged: (Set<Branch> newSelectedBranch) {
                ref
                    .read(settingsProvider.notifier)
                    .updateBranch(newSelectedBranch.first);
              },
            ),

            SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 1, label: Text("sem 1")),
                ButtonSegment(value: 2, label: Text("sem 2")),
                ButtonSegment(value: 3, label: Text("sem 3")),
                ButtonSegment(value: 4, label: Text("sem 4")),
                ButtonSegment(value: 5, label: Text("sem 5")),
                ButtonSegment(value: 6, label: Text("sem 6")),
              ],
              selected: {selectedSemester},
              onSelectionChanged: (Set<int> newSelectedSemester) {
                ref
                    .read(settingsProvider.notifier)
                    .updateSemester(newSelectedSemester.first);
              },
            ),
          ],
        ),
      ),
    );
  }
}
