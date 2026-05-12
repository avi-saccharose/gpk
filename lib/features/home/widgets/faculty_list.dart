import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/widgets/faculty_bottom_sheet.dart';
import 'package:gpk_app/features/faculty/providers/faculty_providers.dart';
import 'package:hugeicons/hugeicons.dart';

class FacultyList extends ConsumerWidget {
  const FacultyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faculty = ref.watch(allFacultyProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: faculty.length,
        itemBuilder: (context, index) {
          final item = faculty[index];
          return Card(
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.4),
            surfaceTintColor: Colors.transparent,
            color: colorScheme.surface, //Colors.white.withValues(alpha: 0.9),
            margin: const EdgeInsetsGeometry.only(right: 16),
            child: InkWell(
              onTap: () {
                showFacultyBottomSheet(context, item);
              },
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: HugeIcon(icon: HugeIcons.strokeRoundedUser02),
                    ),
                    gapH8,
                    Text(
                      item.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
