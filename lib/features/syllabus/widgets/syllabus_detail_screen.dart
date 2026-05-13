import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/app_log.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
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
                  "Subject Detail",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subject?.subjectName ?? "",
                      style: textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ), //AppTextStyles.display,
                    ),
                    Container(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: Sizes.p4,
                        horizontal: Sizes.p8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(Sizes.p8),
                        color: Colors.pink.withValues(alpha: 0.3),
                      ),
                      child: Text(
                        subject!.subjectCode,
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
                gapH8,
                Row(
                  children: [
                    Text(
                      "Total marks: ",
                      style: TextStyle(color: Colors.grey, fontSize: Sizes.p16),
                    ),
                    gapW4,
                    Text(
                      "${subject.totalMarks}",
                      style: TextStyle(fontSize: Sizes.p16),
                    ),
                  ],
                ),
                gapH8,
                if (subject.chapters != null) ...[
                  Expanded(
                    child: Container(
                      padding: EdgeInsetsGeometry.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.6,
                        ),
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: subject.chapters!.length,
                        itemBuilder: (context, index) {
                          final chapter = subject.chapters![index];
                          return Container(
                            margin: EdgeInsetsGeometry.only(bottom: Sizes.p16),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerLowest,
                              borderRadius: BorderRadiusGeometry.circular(16),
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
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              leading: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainerLowest,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: colorScheme.onSurfaceVariant,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      color: colorScheme.onSurfaceVariant,
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
                                      "${chapter.subTopics.length} Subtopics",
                                      style: TextStyle(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          const EdgeInsetsGeometry.symmetric(
                                            horizontal: Sizes.p8,
                                          ),
                                      child: Text(
                                        ".",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "${chapter.chapterMarks} Marks",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              children: chapter.subTopics.map((subtopic) {
                                return ListTile(
                                  contentPadding: const EdgeInsetsGeometry.only(
                                    left: Sizes.p64,
                                  ),
                                  leading: Icon(
                                    Icons.article_outlined,
                                    size: 20,
                                    color: colorScheme.outlineVariant,
                                  ),
                                  title: Text(
                                    subtopic,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.outlineVariant,
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
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          Log.error(subjectCode, error, stackTrace);
          return Center(
            child: Text("error loading subject: $error"),
          );
        },
      ),
    );
  }
}
