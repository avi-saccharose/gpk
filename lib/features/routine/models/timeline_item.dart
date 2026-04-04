class TimelineItem {
  final int startTime;
  final int endTime;
  final String subjectName;
  final String? subjectID;
  final String? instructorName;
  final String iconUrl;

  const TimelineItem({
    required this.startTime,
    required this.endTime,
    required this.subjectName,
    required this.subjectID,
    required this.instructorName,
    required this.iconUrl,
  });
}
