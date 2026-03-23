typedef SubjectCode = String;

class Subject {
  const Subject({
    required this.code,
    required this.name,
    required this.instructor,
  });
  final SubjectCode code;
  final String name;
  final String instructor;
}
