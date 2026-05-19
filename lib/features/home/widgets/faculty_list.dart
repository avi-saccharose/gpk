import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/widgets/faculty_bottom_sheet.dart';
import 'package:gpk_app/core/widgets/loader.dart';
import 'package:gpk_app/features/faculty/providers/faculty_providers.dart';
import 'package:hugeicons/hugeicons.dart';

class FacultyList extends ConsumerWidget {
  const FacultyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faculty = ref.watch(allFacultyProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return faculty.when(
      data: (faculty) => SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: faculty.length,
          itemBuilder: (context, index) {
            final item = faculty[index];
            final imgUrl = item.imgUrl;
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsetsGeometry.only(right: 16),
              child: InkWell(
                onTap: () {
                  // ignore: discarded_futures
                  showFacultyBottomSheet(context, item);
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: imgUrl != null
                            ? AssetImage(imgUrl)
                            : null,
                        child: imgUrl == null
                            ? const HugeIcon(
                                icon: HugeIcons.strokeRoundedUser02,
                              )
                            : null,
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
      ),
      loading: () => const Center(
        child: ElasticWaveLoader(),
      ),

      error: (error, stackTrace) {
        Log.error('loading quote', error, stackTrace);
        return const Text('error loading faculty');
      },
    );
  }
}
