import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/faculty/providers/faculty_providers.dart';
import 'package:gpk_app/features/faculty/widgets/faculty_card.dart';
import 'package:hugeicons/hugeicons.dart';

class FacultyScreen extends ConsumerWidget {
  const FacultyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faculties = ref.watch(filteredFacultyProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              'Academic',
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'Faculty',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            gapH20,
            SearchBar(
              elevation: const WidgetStatePropertyAll(0),
              leading: const HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
              padding: const WidgetStatePropertyAll(
                EdgeInsetsGeometry.symmetric(horizontal: Sizes.p16),
              ),

              onChanged: (value) => {
                ref.read(searchQueryProvider.notifier).set(value),
              },
            ),
            gapH20,
            Expanded(
              child: faculties.isEmpty
                  ? const Center(
                      child: Text('No faculty found'),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: Sizes.p16,
                            mainAxisSpacing: Sizes.p16,
                            childAspectRatio: 0.70,
                            // mainAxisExtent: 150,
                          ),
                      itemCount: faculties.length,
                      itemBuilder: (context, index) {
                        final faculty = faculties[index];
                        return FacultyCard(faculty: faculty);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
