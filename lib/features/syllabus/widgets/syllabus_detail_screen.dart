// Inside SyllabusDetailScreen.dart
import 'package:flutter/material.dart';

class SyllabusDetailScreen extends StatelessWidget {
  final String subjectCode;

  const SyllabusDetailScreen({Key? key, required this.subjectCode})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
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
