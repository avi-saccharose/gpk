import 'package:gpk_app/core/utils/typedefs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_item.g.dart';

@JsonSerializable()
class TimelineItem {
  final int startTime;
  final int endTime;
  final String subjectName;
  final SubjectCode? subjectCode;
  final String? instructorName;
  final String iconUrl;

  const TimelineItem({
    required this.startTime,
    required this.endTime,
    required this.subjectName,
    required this.subjectCode,
    required this.instructorName,
    required this.iconUrl,
  });

  factory TimelineItem.fromJson(Map<String, dynamic> json) =>
      _$TimelineItemFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineItemToJson(this);
}
