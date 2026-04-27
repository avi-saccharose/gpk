import 'package:gpk_app/features/routine/models/timeline_item.dart';

class RoutineBuilder {
  static TimelineItem createItem({
    int startTime = 0,
    int endTime = 20,
    String subjectName = "Physics",
    String? subjectID = "101",
    String? instructorName = "Pete",
    String iconUrl = "assets/icons/physics-64.png",
  }) {
    return TimelineItem(
      startTime: startTime,
      endTime: endTime,
      subjectName: subjectName,
      subjectCode: subjectID,
      instructorName: instructorName,
      iconUrl: iconUrl,
    );
  }

  static List<TimelineItem> createStandardRoutine() {
    return [
      createItem(startTime: 1, endTime: 10, subjectName: "class 1"),
      createItem(startTime: 10, endTime: 20, subjectName: "class 2"),
      createItem(startTime: 20, endTime: 30, subjectName: "class 3"),
      createItem(startTime: 30, endTime: 40, subjectName: "class 4"),
    ];
  }
}
