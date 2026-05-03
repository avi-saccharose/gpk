import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:hugeicons/hugeicons.dart';

class FacultyCard extends StatelessWidget {
  const FacultyCard({
    super.key,
    required this.faculty,
  });

  final Faculty faculty;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(Sizes.p16),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsetsGeometry.only(top: 8, bottom: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                gapH12,
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/helen.jpeg'),
                ),

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
                gapH24,
                const Divider(),
                ListTile(
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedSmartPhone02),
                  title: const Text('Phone number'),
                  subtitle: Text(faculty.number ?? "Not available"),
                ),
                ListTile(
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                  title: const Text("Email"),
                  subtitle: Text(faculty.email ?? "Not available"),
                ),
                ListTile(
                  leading: HugeIcon(icon: HugeIcons.strokeRoundedAddressBook),
                  title: const Text('Address'),
                  subtitle: Text(faculty.address ?? "Not available"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              backgroundImage: AssetImage(
                'assets/images/helen.jpeg',
              ),
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
                onPressed: () => _showBottomSheet(context),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
