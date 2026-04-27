// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineItem _$TimelineItemFromJson(Map<String, dynamic> json) => TimelineItem(
  startTime: (json['startTime'] as num).toInt(),
  endTime: (json['endTime'] as num).toInt(),
  subjectName: json['subjectName'] as String,
  subjectCode: json['subjectCode'] as String?,
  instructorName: json['instructorName'] as String?,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$TimelineItemToJson(TimelineItem instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'subjectName': instance.subjectName,
      'subjectCode': instance.subjectCode,
      'instructorName': instance.instructorName,
      'iconUrl': instance.iconUrl,
    };
