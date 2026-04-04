import 'package:gpk_app/core/data/test_data.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';

class MockRoutineRepository {
  MockRoutineRepository._();
  static MockRoutineRepository instance = MockRoutineRepository._();
  List<TimelineItem> getRoutine() {
    return kTestTimeline;
  }
}
