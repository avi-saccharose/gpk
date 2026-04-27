// Inside SyllabusDetailScreen.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/utils/app_log.dart';
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
        data: (subject) => Column(
          children: [
            // ... Syllabus content ...
            ListTile(
              leading: Icon(Icons.person),
              title: Text(subjectCode),
              subtitle: Text('Tap for Faculty Info'),
              onTap: () {},
            ),
          ],
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
