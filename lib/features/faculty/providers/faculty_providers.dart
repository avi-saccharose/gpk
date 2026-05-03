import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faculty_providers.g.dart';

@riverpod
List<Faculty> allFaculty(Ref ref) {
  return [
    Faculty("Vikehtol", "BSC", "96129020202", 'vike@gmail.com', null),
    Faculty("Puthu", "BSC", "23002003003", null, null),
    Faculty("Sofia", "MSC", "3939929939", 'sofia@gmail.com', null),
    Faculty("Pete", "MSC", "3939929939", 'pete@gmail.com', null),
    Faculty("Neisa", "MSC", "3939929939", null, null),
    Faculty("Yeben", "MSC", "3939929939", null, null),
  ];
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return "";
  }

  void set(String value) {
    state = value;
  }
}

@riverpod
List<Faculty> filteredFaculty(Ref ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final allFaculty = ref.watch(allFacultyProvider);
  if (query.isEmpty) {
    return allFaculty;
  }

  return allFaculty
      .where((faculty) => faculty.name.toLowerCase().contains(query))
      .toList();
}
