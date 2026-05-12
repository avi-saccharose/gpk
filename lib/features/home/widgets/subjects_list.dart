import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/app_navigation.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';
import 'package:gpk_app/features/syllabus/providers/syllabus_providers.dart';
import 'package:hugeicons/hugeicons.dart';

class SubjectsList extends ConsumerWidget {
  const SubjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syllabus = ref.watch(syllabusProvider);
    return syllabus.when(
      data: (syllabus) => SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: syllabus.subjects.length,
          itemBuilder: (context, index) {
            final subject = syllabus.subjects[index];
            return SubjectCard(subject: subject);
          },
        ),
      ),
      loading: () => Padding(
        padding: const EdgeInsetsGeometry.only(top: 24),
        child: Center(
          child: ElasticWaveLoader(),
        ),
      ),
      error: (error, stackTrace) {
        Log.error("subjects list", error, stackTrace);
        return Text("Error loading subjects");
      },
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.4),
      surfaceTintColor: Colors.transparent,
      color: colorScheme.surface, //Colors.white.withValues(alpha: 0.9),
      child: InkWell(
        onTap: () {
          context.go("${AppRouter.syllabus}/${subject.subjectCode}");
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.onPrimaryContainer,
                child: HugeIcon(icon: HugeIcons.strokeRoundedBacteria),
              ),
              gapW16,
              Text(
                subject.subjectName,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
