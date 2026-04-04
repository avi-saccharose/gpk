import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/utils/time_helper.dart';

final kTestTimeline = [
  TimelineItem(
    startTime: hmToMins(12, 30),
    endTime: hmToMins(13, 30),
    subjectName: "Physics",
    subjectID: "101",
    instructorName: "Pete",
    iconUrl: "assets/icons/physics-64.png",
  ),
  TimelineItem(
    startTime: hmToMins(13, 30),
    endTime: hmToMins(14, 30),
    subjectName: "Chemistry",
    subjectID: "102",
    instructorName: "Puthu",
    iconUrl: "assets/icons/test-tube-64.png",
  ),
  TimelineItem(
    startTime: hmToMins(14, 30),
    endTime: hmToMins(15, 30),
    subjectName: "Maths",
    subjectID: "101",
    instructorName: "Kenei",
    iconUrl: "assets/icons/pi-64.png",
  ),
  TimelineItem(
    startTime: hmToMins(15, 30),
    endTime: hmToMins(19, 07),
    subjectName: "Break",
    subjectID: null,
    instructorName: null,
    iconUrl: "assets/icons/ice-cream-cone-64.png",
  ),
  TimelineItem(
    startTime: hmToMins(19, 07),
    endTime: hmToMins(19, 08),
    subjectName: "Digital Ciruit",
    subjectID: "10",
    instructorName: "Ayang",
    iconUrl: "assets/icons/transistor-64.png",
  ),
  TimelineItem(
    startTime: hmToMins(19, 08),
    endTime: hmToMins(23, 30),
    subjectName: "C programming",
    subjectID: "99",
    instructorName: "Vikethol",
    iconUrl: "assets/icons/c-programming-64.png",
  ),
];
