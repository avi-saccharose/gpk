import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsNotifier = ref.watch(settingsProvider);
    final selectedBranch = settingsNotifier.selectedBranch;
    final selectedSemester = settingsNotifier.selectedSemester;
    final isDarkMode = settingsNotifier.isDarkMode;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    const branches = [Branch.cse, Branch.ce, Branch.ft];
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: "PROFILE"),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.person_outlined),
                        label: const Text("Name"),
                      ),
                      onSubmitted: (String text) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateDisplayName(text);
                      },
                    ),
                  ),
                ),

                gapH24,

                SectionTitle(
                  title: "ACADEMIC INFORMATION",
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Branch",
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        gapH8,

                        Wrap(
                          spacing: 8,
                          children: List.generate(3, (index) {
                            final branch = branches[index];
                            return ChoiceChip(
                              label: Text("$branch"),
                              selected: selectedBranch == branch,
                              onSelected: (_) {
                                ref
                                    .read(settingsProvider.notifier)
                                    .updateBranch(branch);
                              },
                            );
                          }),
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

                gapH24,

                SectionTitle(
                  title: "THEME",
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RadioGroup<bool>(
                      groupValue: isDarkMode,
                      onChanged: (value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateTheme(value ?? false);
                      },
                      child: Column(
                        children: [
                          RadioListTile(
                            title: const Row(
                              children: [
                                HugeIcon(icon: HugeIcons.strokeRoundedSun03),
                                gapW8,
                                Text("Light"),
                              ],
                            ),
                            value: false,
                          ),
                          Divider(),
                          RadioListTile(
                            title: const Row(
                              children: [
                                HugeIcon(icon: HugeIcons.strokeRoundedMoon01),
                                gapW8,
                                Text("Dark"),
                              ],
                            ),
                            value: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                gapH24,
                SectionTitle(title: "APP DATA"),
                Card(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Clear Cache",
                                    style: textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Clear cached data to refetch updated content",
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            FilledButton(
                              onPressed: () {},
                              child: Text('clear'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                gapH24,
                SectionTitle(title: "ABOUT"),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const HugeIcon(
                            icon: HugeIcons.strokeRoundedBadgeInfo,
                          ),
                          title: Text("Version"),
                          subtitle: Text('1.0.0'),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const HugeIcon(
                            icon: HugeIcons.strokeRoundedLicenseDraft,
                          ),
                          title: const Text("Licenses"),
                          subtitle: const Text("MIT License"),
                          onTap: () {
                            showLicensePage(context: context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const HugeIcon(
                            icon: HugeIcons.strokeRoundedGithub01,
                          ),
                          title: const Text("Github"),
                          subtitle: const Text(
                            "https://github.com/avi-saccharose/gpk",
                          ),
                          onTap: () async {
                            final Uri url = Uri.parse(
                              'https://github.com/avi-saccharose/gpk',
                            );
                            try {
                              await launchUrl(url);
                            } catch (error, stackTrace) {
                              Log.error("launch whatsapp", error, stackTrace);
                            }
                          },
                        ),
                        gapH8,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Text(
      title,
      style: textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.primary,
        letterSpacing: 1.5,
      ),
    );
  }
}
