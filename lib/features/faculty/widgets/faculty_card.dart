import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:gpk_app/core/widgets/faculty_bottom_sheet.dart';
import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:hugeicons/hugeicons.dart';

class FacultyCard extends StatelessWidget {
  const FacultyCard({super.key, required this.faculty});

  final Faculty faculty;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,

      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorScheme.outline,
        ),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/helen.jpeg'),
            ),
            gapH8,
            // Image(
            //   image: AssetImage('assets/images/helen.jpeg'),
            //   fit: BoxFit.cover,
            // ),
            Text(
              faculty.name,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            gapH4,
            Text(
              faculty.qualification,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),

            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => showFacultyBottomSheet(context, faculty),
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
