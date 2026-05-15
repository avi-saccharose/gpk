import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/utils/typedefs.dart';
import 'package:gpk_app/features/syllabus/providers/syllabus_providers.dart';

class SyllabusDetailScreen extends ConsumerWidget {
  final SubjectCode subjectCode;

  const SyllabusDetailScreen({super.key, required this.subjectCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final subject = ref.watch(subjectByCodeProvider(subjectCode));
    return Scaffold(
      appBar: AppBar(),
      body: subject.when(
        data: (subject) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject Detail',
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        subject?.subjectName ?? '',
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ), //AppTextStyles.display,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsGeometry.symmetric(
                        vertical: Sizes.p4,
                        horizontal: Sizes.p8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(Sizes.p8),
                        color: Colors.pink.withValues(alpha: 0.3),
                      ),
                      child: Text(
                        subject!.subjectCode,
                        style: const TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
                gapH8,
                Row(
                  children: [
                    Text(
                      'Total marks: ',
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: Sizes.p16,
                      ),
                    ),
                    gapW4,
                    Text(
                      '${subject.totalMarks}',
                      style: const TextStyle(fontSize: Sizes.p16),
                    ),
                  ],
                ),
                gapH8,
                if (subject.chapters != null) ...[
                  Expanded(
                    child: Card.outlined(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colorScheme.outline,
                        ),
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: ListView.builder(
                        itemCount: subject.chapters!.length,
                        itemBuilder: (context, index) {
                          final chapter = subject.chapters![index];
                          return Container(
                            margin: const EdgeInsetsGeometry.symmetric(
                              horizontal: Sizes.p16,
                              vertical: Sizes.p8,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHigh,
                              borderRadius: BorderRadiusGeometry.circular(16),
                              border: Border.all(
                                color: colorScheme.outline,
                              ),
                            ),
                            child: ExpansionTile(
                              shape: const Border(),
                              title: Text(
                                chapter.chapterName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              leading: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: colorScheme.primary.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: Sizes.p4),
                                child: Row(
                                  children: [
                                    Text(
                                      '${chapter.subTopics.length} Subtopics',
                                      style: TextStyle(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: Sizes.p8,
                                      ),
                                      child: Text(
                                        '.',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '${chapter.chapterMarks} Marks',
                                      style: TextStyle(
                                        color: colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              children: chapter.subTopics.map((subtopic) {
                                return ListTile(
                                  titleAlignment: ListTileTitleAlignment.top,
                                  contentPadding: const EdgeInsetsGeometry.only(
                                    left: Sizes.p64,
                                  ),
                                  leading: Icon(
                                    Icons.article_outlined,
                                    size: 20,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  title: Text(
                                    subtopic,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          Log.error(subjectCode, error, stackTrace);
          return Center(
            child: Text('error loading subject: $error'),
          );
        },
      ),
    );
  }
}
