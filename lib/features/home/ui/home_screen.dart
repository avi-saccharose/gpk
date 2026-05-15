import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/home/providers/home_providers.dart';
import 'package:gpk_app/features/home/widgets/faculty_list.dart';
import 'package:gpk_app/features/home/widgets/subjects_list.dart';
import 'package:gpk_app/features/home/widgets/upcoming_events.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/routing/app_router.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String displayName = ref.watch(settingsProvider).displayName;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedSettings05,
              size: 30.0,
            ),
            onPressed: () => context.push('/setting'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH20,
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  displayName,
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                gapH32,
                const SectionHeader(title: 'Quote of the day'),

                const QuoteOfTheDay(),
                gapH32,
                const SectionHeader(
                  title: 'Upcoming Events',
                  destination: AppRoutes.calendar,
                ),
                gapH8,

                const UpcomingEvents(),
                gapH32,
                const SectionHeader(
                  title: 'Subjects',
                  destination: AppRoutes.syllabus,
                ),
                gapH8,

                const SubjectsList(),
                gapH32,
                const SectionHeader(
                  title: 'Faculty',
                  destination: AppRoutes.faculty,
                ),
                gapH8,

                const FacultyList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuoteOfTheDay extends ConsumerWidget {
  const QuoteOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final data = ref.watch(getQuoteOfDayProvider);
    return data.when(
      data: (quote) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.format_quote),
              gapH8,
              Text(
                quote.quote,
                style: textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  height: 1.5,
                  color: colorScheme.onSurface,
                ),
              ),
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 1,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  gapW8,
                  Text(
                    quote.author,
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  gapW8,
                  Container(
                    width: 24,
                    height: 1,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(
        child: ElasticWaveLoader(),
      ),
      error: (error, stackTrace) {
        Log.error('loading quote', error, stackTrace);
        return const Text('error loading quote');
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? destination;
  const SectionHeader({super.key, required this.title, this.destination});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        if (destination != null)
          TextButton(
            onPressed: () {
              context.go(destination!);
            },
            child: Row(
              children: [
                Text(
                  'See All',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                gapW4,
                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
              ],
            ),
          ),
      ],
    );
  }
}
