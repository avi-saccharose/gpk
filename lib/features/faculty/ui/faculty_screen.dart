import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:gpk_app/features/faculty/providers/faculty_providers.dart';
import 'package:gpk_app/features/faculty/widgets/faculty_card.dart';

class FacultyScreen extends ConsumerWidget {
  const FacultyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faculties = ref.watch(filteredFacultyProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              "Academic",
              style: AppTextStyles.label,
            ),
            Text(
              "Faculty",
              style: AppTextStyles.display,
            ),
            gapH20,
            SearchBar(
              onChanged: (value) => {
                ref.read(searchQueryProvider.notifier).state = value,
              },
            ),
            gapH20,
            Expanded(
              child: faculties.isEmpty
                  ? Center(
                      child: Text("No faculty found"),
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
