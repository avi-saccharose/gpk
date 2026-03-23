import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/utils/time_helper.dart';

final kTestTimeline = [
  TimelineItem(
    startTime: hmToMins(12, 30),
    endTime: hmToMins(13, 30),
    subjectName: "Physics",
    subjectID: "101",
    instructorName: "Pete",
  ),
  TimelineItem(
    startTime: hmToMins(13, 30),
    endTime: hmToMins(14, 30),
    subjectName: "Chemistry",
    subjectID: "102",
    instructorName: "Puthu",
  ),
  TimelineItem(
    startTime: hmToMins(14, 30),
    endTime: hmToMins(15, 30),
    subjectName: "Maths",
    subjectID: "101",
    instructorName: "Kenei",
  ),
  TimelineItem(
    startTime: hmToMins(15, 30),
    endTime: hmToMins(16, 30),
    subjectName: "Break",
    subjectID: null,
    instructorName: null,
  ),
  TimelineItem(
    startTime: hmToMins(16, 30),
    endTime: hmToMins(17, 30),
    subjectName: "Digital Ciruit",
    subjectID: "10",
    instructorName: "Ayang",
  ),
  TimelineItem(
    startTime: hmToMins(17, 30),
    endTime: hmToMins(18, 30),
    subjectName: "C programming",
    subjectID: "99",
    instructorName: "Vikethol",
  ),
];
