import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/widgets/header_text.dart';
import 'package:gpk_app/core/widgets/sub_heading.dart';
import 'package:gpk_app/core/widgets/subtitle_text.dart';
import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:intl/intl.dart';

class EventsBottomSheet extends StatelessWidget {
  final List<Event> events;
  final DateTime date;
  const EventsBottomSheet({
    super.key,
    required this.events,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat().add_yMMMd().format(date);
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: EdgeInsetsGeometry.only(top: 8, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(text: "Events"),
                gapH4,
                SubtitleText(text: formattedDate),
                gapH12,
                for (var event in events)
                  BottomSheetItem(
                    title: event.title,
                    description: event.description,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  final String title;
  final String description;
  const BottomSheetItem({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsGeometry.all(Sizes.p4),
      padding: EdgeInsetsGeometry.all(Sizes.p16),
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(text: title),
          gapH4,
          SubtitleText(text: description),
        ],
      ),
    );
  }
}
