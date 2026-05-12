import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/app_navigation.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/home/providers/home_providers.dart';
import 'package:gpk_app/features/home/widgets/faculty_list.dart';
import 'package:gpk_app/features/home/widgets/subjects_list.dart';
import 'package:gpk_app/features/home/widgets/upcoming_events.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
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
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSettings05, size: 30.0),
            onPressed: () => context.push('/setting'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH20,
                Text(
                  "Hello",
                  style: AppTextStyles.label,
                ),
                Text(
                  displayName,
                  style: AppTextStyles.display,
                ),
                gapH20,
                Text(
                  "Quote of the day",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: colorScheme.primary,
                  ),
                ),
                QuoteOfTheDay(),
                gapH32,
                SectionHeader(
                  title: "Upcoming Events",
                  location: AppRouter.calendar,
                ),
                gapH8,

                UpcomingEvents(),
                gapH32,
                SectionHeader(
                  title: "Subjects",
                  location: AppRouter.syllabus,
                ),
                gapH8,

                SubjectsList(),
                gapH32,
                SectionHeader(
                  title: "Faculty",
                  location: AppRouter.faculty,
                ),
                gapH8,

                FacultyList(),
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
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.4),
        surfaceTintColor: Colors.transparent,
        color: colorScheme.surface, //Colors.white.withValues(alpha: 0.9),
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.format_quote),
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
                    color: colorScheme.onSurface.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  gapW8,
                  Text(
                    quote.author,
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
                  gapW8,
                  Container(
                    width: 24,
                    height: 1,
                    color: colorScheme.onSurface.withValues(
                      alpha: 0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      loading: () => Center(
        child: ElasticWaveLoader(),
      ),
      error: (error, stackTrace) {
        Log.error("loading quote", error, stackTrace);
        return Text("error loading quote");
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String location;
  const SectionHeader({super.key, required this.title, required this.location});

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
        TextButton(
          onPressed: () {
            context.go(location);
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
              HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
            ],
          ),
        ),
      ],
    );
  }
}
