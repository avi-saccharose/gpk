import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';

class EventList extends ConsumerWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyEvents = ref.watch(monthlyEventsProvider);
    return monthlyEvents.when(
      data: (data) {
        if (data.isEmpty) return Text("no events");
        return Expanded(
          child: ListView.builder(
            //shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final event = data[index];
              return EventListItem(
                title: event.title,
                description: event.description,
              );
            },
          ),
        );
      },
      loading: () {
        return CircularProgressIndicator();
      },

      // TODO: handle error
      error: (error, stackTrace) {
        return Text("Error");
      },
    );
  }
}

class EventListItem extends StatelessWidget {
  final String title;
  final String description;
  const EventListItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Column(
        children: [
          Text(title),
          gapH8,
          Text(description),
        ],
      ),
    );
  }
}
