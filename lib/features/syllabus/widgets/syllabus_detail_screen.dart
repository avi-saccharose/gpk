// Inside SyllabusDetailScreen.dart
import 'package:flutter/material.dart';

class SyllabusDetailScreen extends StatelessWidget {
  final String courseId;

  const SyllabusDetailScreen({Key? key, required this.courseId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ideally, you'd use your state management (like Riverpod) here
    // to fetch the course details using the courseId.

    return Scaffold(
      body: Column(
        children: [
          // ... Syllabus content ...
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Prof. Alan Turing'),
            subtitle: Text('Tap for Faculty Info'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

