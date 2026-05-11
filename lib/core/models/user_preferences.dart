import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';

class UserPreferences {
  bool isDarkMode;
  Branch selectedBranch;
  Semester selectedSemester;
  String displayName;
  UserPreferences({
    this.isDarkMode = false,
    this.selectedBranch = Branch.cse,
    this.selectedSemester = Semester.first,
    this.displayName = "User",
  });

  UserPreferences copyWith({
    bool? isDarkMode,
    Branch? selectedBranch,
    Semester? selectedSemester,
    String? displayName,
  }) {
    return UserPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      selectedSemester: selectedSemester ?? this.selectedSemester,
      displayName: displayName ?? this.displayName,
    );
  }
}
