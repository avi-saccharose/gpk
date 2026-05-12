import 'package:gpk_app/features/calendar/models/event.dart';
import 'package:gpk_app/features/calendar/providers/calendar_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
Future<Map<DateTime, List<Event>>> upcomingEventsMap(Ref ref) async {
  final events = await ref.watch(monthlyEventsMapProvider.future);
  final now = DateTime.now();
  final filteredMap = events.entries
      .where((entry) {
        final date = entry.key;
        return now.year == date.year &&
            now.month == date.month &&
            date.day > now.day;
      })
      .take(1);
  return Map<DateTime, List<Event>>.fromEntries(filteredMap);
}
