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
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/helen.jpeg'),
            ),
            gapH8,
            // Image(
            //   image: AssetImage('assets/images/helen.jpeg'),
            //   fit: BoxFit.cover,
            // ),
            Text(
              faculty.name,
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            gapH4,
            Text(
              faculty.qualification,
              style: AppTextStyles.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),

            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => showFacultyBottomSheet(context, faculty),
                icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
