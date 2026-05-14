import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/semester.dart';

class UserPreferences {
  bool isDarkMode;
  Branch selectedBranch;
  Semester selectedSemester;
  String displayName;
  bool completedOnboarding;
  UserPreferences({
    this.isDarkMode = false,
    this.selectedBranch = Branch.cse,
    this.selectedSemester = Semester.first,
    this.displayName = "User",
    this.completedOnboarding = false,
  });

  UserPreferences copyWith({
    bool? isDarkMode,
    Branch? selectedBranch,
    Semester? selectedSemester,
    String? displayName,
    bool? completedOnboarding,
  }) {
    return UserPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      selectedSemester: selectedSemester ?? this.selectedSemester,
      displayName: displayName ?? this.displayName,
      completedOnboarding: completedOnboarding ?? this.completedOnboarding,
    );
  }
}
