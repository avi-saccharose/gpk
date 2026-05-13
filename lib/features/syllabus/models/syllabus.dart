import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/utils/typedefs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'syllabus.g.dart';

@JsonSerializable()
class Syllabus {
  final Branch branch;
  final int semester;
  List<Subject> subjects;

  Syllabus(this.branch, this.semester, this.subjects);

  factory Syllabus.fromJson(Map<String, dynamic> json) =>
      _$SyllabusFromJson(json);

  Map<String, dynamic> toJson() => _$SyllabusToJson(this);
}

@JsonSerializable()
class Subject {
  final String subjectName;
  final SubjectCode subjectCode;
  final int totalMarks;
  List<Chapter>? chapters;

  Subject(this.subjectName, this.subjectCode, this.totalMarks);

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Chapter {
  final String chapterName;
  final int chapterMarks;

  @JsonKey(defaultValue: [])
  final List<String> subTopics;
  Chapter(this.chapterName, this.chapterMarks, this.subTopics);

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
