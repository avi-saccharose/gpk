// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Syllabus _$SyllabusFromJson(Map<String, dynamic> json) => Syllabus(
  $enumDecode(_$BranchEnumMap, json['branch']),
  (json['semester'] as num).toInt(),
  (json['subjects'] as List<dynamic>)
      .map((e) => Subject.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SyllabusToJson(Syllabus instance) => <String, dynamic>{
  'branch': _$BranchEnumMap[instance.branch]!,
  'semester': instance.semester,
  'subjects': instance.subjects,
};

const _$BranchEnumMap = {Branch.cse: 'cse', Branch.ce: 'ce', Branch.ft: 'ft'};

Subject _$SubjectFromJson(Map<String, dynamic> json) =>
    Subject(
        json['subjectName'] as String,
        json['subjectCode'] as String,
        (json['totalMarks'] as num).toInt(),
      )
      ..chapters = (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'subjectName': instance.subjectName,
  'subjectCode': instance.subjectCode,
  'totalMarks': instance.totalMarks,
  'chapters': instance.chapters,
};

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
  json['chapterName'] as String,
  (json['chapterMarks'] as num).toInt(),
  (json['subtopics'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
  'chapterName': instance.chapterName,
  'chapterMarks': instance.chapterMarks,
  'subtopics': instance.subtopics,
};
