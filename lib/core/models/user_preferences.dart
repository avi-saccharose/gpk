import 'package:gpk_app/core/models/branch.dart';

class UserPreferences {
  bool isDarkMode;
  Branch selectedBranch;
  int selectedSemester;

  UserPreferences({
    this.isDarkMode = false,
    this.selectedBranch = Branch.cse,
    this.selectedSemester = 1,
  });

  UserPreferences copyWith({
    bool? isDarkMode,
    Branch? selectedBranch,
    int? selectedSemester,
  }) {
    return UserPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      selectedSemester: selectedSemester ?? this.selectedSemester,
    );
  }
}
