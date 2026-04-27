import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class SyllabusScreen extends ConsumerWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBranch = ref.watch(settingsProvider).selectedBranch;
    final selectedSemester = ref.watch(settingsProvider).selectedSemester;
    final List<String> items = [
      "maths",
      "science",
      "physics",
      "chemistry",
      "enigeering drawing",
    ];
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

            // uses expaned to work around column height error
            // will have to use slivers if we want to add content after the grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: Sizes.p8,
                crossAxisSpacing: Sizes.p32,
                children: List.generate(
                  items.length,
                  (index) {
                    return SubjectCard(item: items[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.item,
  });

  final String item;

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
        onTap: () => context.push('/syllabus/$item'),
        borderRadius: BorderRadius.circular(Sizes.p16),
        child: Container(
          padding: const EdgeInsetsGeometry.all(Sizes.p20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p16),
            border: Border(
              left: BorderSide(color: Colors.red, width: Sizes.p4),
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
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(Sizes.p8),
                ),
                child: Text(
                  "CS 215",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              gapH16,
              Text(
                item,
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
