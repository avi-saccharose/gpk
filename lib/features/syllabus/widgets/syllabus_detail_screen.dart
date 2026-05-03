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
                      style: AppTextStyles.display,
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
                      "${subject!.totalMarks}",
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
                        color: Colors.white60,
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
                              color: Colors.white60,
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
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              leading: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
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
                                      "${chapter.subtopics.length} Subtopics",
                                      style: TextStyle(color: Colors.grey[600]),
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
                              children: chapter.subtopics.map((subtopic) {
                                return ListTile(
                                  contentPadding: const EdgeInsetsGeometry.only(
                                    left: Sizes.p64,
                                  ),
                                  leading: Icon(
                                    Icons.article_outlined,
                                    size: 20,
                                    color: Colors.grey.shade400,
                                  ),
                                  title: Text(
                                    subtopic,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade500,
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
