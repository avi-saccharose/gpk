import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faculty_providers.g.dart';

@riverpod
Future<List<Faculty>> allFaculty(Ref ref) async {
  final String data = await rootBundle.loadString('assets/json/faculty.json');
  final List<dynamic> json = jsonDecode(data);
  final result = json.map((elem) => Faculty.fromJson(elem)).toList();
  return result;
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void set(String value) {
    state = value;
  }
}

@riverpod
Future<List<Faculty>> filteredFaculty(Ref ref) async {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final allFaculty = await ref.watch(allFacultyProvider.future);
  if (query.isEmpty) {
    return allFaculty;
  }

  return allFaculty
      .where((faculty) => faculty.name.toLowerCase().contains(query))
      .toList();
}
