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
}

@JsonSerializable()
class Chapter {
  final String chapterName;
  final int chapterMarks;
  final List<String> subtopics;
  Chapter(this.chapterName, this.chapterMarks, this.subtopics);

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
