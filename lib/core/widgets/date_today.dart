import 'package:flutter/material.dart';

class DateToday extends StatelessWidget {
  const DateToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "May 5 2020",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          'Today',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
