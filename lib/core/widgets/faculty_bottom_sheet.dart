import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp(String number) async {
  // Remove all non digits from the string
  final phoneNumber = number.replaceAll(RegExp(r'\D'), '');
  final Uri whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');
  try {
    await launchUrl(whatsappUrl);
  } catch (error, stackTrace) {
    Log.error('launch whatsapp', error, stackTrace);
  }
}

Future<void> showFacultyBottomSheet(
  BuildContext context,
  Faculty faculty,
) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      final colorScheme = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;
      final imgUrl = faculty.imgUrl;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(Sizes.p16),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsetsGeometry.only(top: 8, bottom: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              gapH12,
              CircleAvatar(
                radius: 50,
                backgroundImage: imgUrl != null ? AssetImage(imgUrl) : null,
                child: imgUrl == null
                    ? const HugeIcon(icon: HugeIcons.strokeRoundedUser02)
                    : null,
              ),

              Text(
                faculty.name,
                style: textTheme.titleLarge,
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
              gapH24,
              const Divider(),
              ListTile(
                leading: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSmartPhone02,
                ),
                title: const Text('Phone number'),
                subtitle: Text(faculty.number ?? 'Not available'),
                trailing: const HugeIcon(icon: HugeIcons.strokeRoundedWhatsapp),
                onTap: () async {
                  if (faculty.number != null) {
                    await openWhatsApp(faculty.number!);
                  }
                },
              ),
              ListTile(
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedMail01),
                title: const Text('Email'),
                subtitle: Text(faculty.email ?? 'Not available'),
              ),
              ListTile(
                leading: const HugeIcon(
                  icon: HugeIcons.strokeRoundedAddressBook,
                ),
                title: const Text('Address'),
                subtitle: Text(faculty.address ?? 'Not available'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
