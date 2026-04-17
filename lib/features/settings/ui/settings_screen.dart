import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsNotifier = ref.watch(settingsProvider);
    return Column(
      children: [
        Text(settingsNotifier.isDarkMode.toString()),
        Switch(
          value: settingsNotifier.isDarkMode,
          onChanged: (value) =>
              ref.read(settingsProvider.notifier).updateTheme(value),
        ),
      ],
    );
  }
}
