import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';

// Wrapper class for working with our cache as it cannot store typed maps directly
class RoutineSchedule {
  final Map<Day, List<TimelineItem>> scheduleMap;
  RoutineSchedule(this.scheduleMap);
}
