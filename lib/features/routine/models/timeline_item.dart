class TimelineItem {
  final int startTime;
  final int endTime;
  final String subjectName;
  final String? subjectID;
  final String? instructorName;

  const TimelineItem({
    required this.startTime,
    required this.endTime,
    required this.subjectName,
    required this.subjectID,
    required this.instructorName,
  });
}
