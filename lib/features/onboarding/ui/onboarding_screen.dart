import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final settingsNotifier = ref.watch(settingsProvider);
    final selectedBranch = settingsNotifier.selectedBranch;
    final selectedSemester = settingsNotifier.selectedSemester;

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "Your student companion app",
            image: const SafeArea(
              child: Icon(Icons.school, size: 120),
            ),
          ),
          PageViewModel(
            titleWidget: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    size: 48,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  "PROFILE SETUP",
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "you can change these later anytime",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            bodyWidget: Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  Text(
                    "USER INFORMATION",
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                      letterSpacing: 1.5,
                    ),
                  ),
                  gapH8,
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH12,
                          Text(
                            "Name",
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          gapH8,

                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(Icons.person_outlined),
                              label: const Text("Name"),
                            ),
                            onChanged: (String text) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .updateDisplayName(text);
                            },
                          ),
                          gapH8,
                          const Divider(),
                          gapH12,

                          Text(
                            "Branch",
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          gapH8,

                          Wrap(
                            spacing: 8,
                            children: [Branch.cse, Branch.ce, Branch.ft]
                                .map(
                                  (branch) => ChoiceChip(
                                    label: Text("$branch"),
                                    selected: selectedBranch == branch,
                                    onSelected: (_) {
                                      ref
                                          .read(settingsProvider.notifier)
                                          .updateBranch(branch);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          gapH12,
                          const Divider(),
                          gapH12,
                          Text(
                            "Semester",
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          gapH8,
                          Wrap(
                            spacing: 12,
                            runSpacing: 8,
                            children: List.generate(
                              6,
                              (index) {
                                final sem = index + 1;

                                return ChoiceChip(
                                  label: Text('Sem $sem'),
                                  selected: selectedSemester.value == sem,
                                  onSelected: (_) {
                                    ref
                                        .read(settingsProvider.notifier)
                                        .updateSemester(sem);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        showSkipButton: false,
        showBackButton: true,
        back: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
        done: const Text("Done"),
        next: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
        onDone: () async {
          await ref.read(settingsProvider.notifier).completeOnboarding();
        },
      ),
    );
  }
}
