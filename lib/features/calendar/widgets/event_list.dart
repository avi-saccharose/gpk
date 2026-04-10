import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';

class EventList extends ConsumerWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyEvents = ref.watch(monthlyEventsProvider);
    return monthlyEvents.when(
      data: (data) {
        if (data.isEmpty) return Text("no events");
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final event = data[index];
            return Text(event.title);
          },
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
