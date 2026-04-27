import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';
import 'package:gpk_app/features/syllabus/models/syllabus.dart';
import 'package:gpk_app/features/syllabus/providers/syllabus_providers.dart';

class SyllabusScreen extends ConsumerWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBranch = ref.watch(settingsProvider).selectedBranch;
    final selectedSemester = ref.watch(settingsProvider).selectedSemester;
    final syllabus = ref.watch(syllabusProvider);
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,

            Text(
              "Syllabus",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              '$selectedBranch $selectedSemester',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            gapH20,

            syllabus.when(
              data: (data) => SubjectsGrid(
                subjects: data.subjects,
              ),
              error: (error, stackTrace) {
                Log.error("fetch syllabus", error, stackTrace);
                return Text("Error fetching syllabus");
              },
              loading: () => CircularProgressIndicator(),
            ),
            // uses expaned to work around column height error
            // will have to use slivers if we want to add content after the grid
          ],
        ),
      ),
    );
  }
}

class SubjectsGrid extends StatelessWidget {
  const SubjectsGrid({
    super.key,
    required this.subjects,
  });
  final List<Subject> subjects;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: Sizes.p8,
        crossAxisSpacing: Sizes.p32,
        children: List.generate(
          subjects.length,
          (index) {
            final item = subjects[index];
            final color = _getColor(index);
            return SubjectCard(
              item: item,
              color: color,
            );
          },
        ),
      ),
    );
  }

  Color _getColor(int index) {
    final colors = [
      Colors.indigo,
      Colors.teal,
      Colors.deepOrange,
      Colors.purple,
      Colors.blue,
      Colors.pinkAccent,
    ];
    return colors[index % colors.length];
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.item,
    required this.color,
  });

  final Color color;
  final Subject item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
      ),
      child: InkWell(
        onTap: () => context.push('/syllabus/${item.subjectCode}'),
        borderRadius: BorderRadius.circular(Sizes.p16),
        child: Container(
          padding: const EdgeInsetsGeometry.all(Sizes.p20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p16),
            border: Border(
              left: BorderSide(color: color, width: Sizes.p4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: Sizes.p8,
                  vertical: Sizes.p4,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(Sizes.p8),
                ),
                child: Text(
                  item.subjectCode,
                  style: TextStyle(color: color),
                ),
              ),
              gapH16,
              Text(
                item.subjectName,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  height: 1.3,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
