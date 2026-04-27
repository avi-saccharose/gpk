// Inside SyllabusDetailScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/settings/providers/settings_providers.dart';

class SyllabusDetailScreen extends ConsumerWidget {
  final String subjectCode;

  const SyllabusDetailScreen({super.key, required this.subjectCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
    );
  }
}
