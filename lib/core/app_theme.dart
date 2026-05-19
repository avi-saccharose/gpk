import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'inter',
      scaffoldBackgroundColor: const Color(0xFFEAEFF8),
      dividerColor: const Color(0xFFE3E8F5),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF4F7CFF),
        surface: Color(0xFFF5F7FF),
        onSurface: Color(0xFF1F2A4A),
        onSurfaceVariant: Color(0xFF5B6780),
        surfaceContainerHigh: Color(0xFFDEE7FF),
        outline: Color(0xFFE3E8F5),
        outlineVariant: Color(0xFFBCC6DC),
        primaryContainer: Color(0xFFC6D5FB),
        onPrimaryContainer: Color(0xFF0A1535),
        error: Color(0xFFBA1A1A),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFFDAD6),
        onErrorContainer: Color(0xFF410002),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFEAEFF8),
      ),

      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStateProperty.all(const Color(0xFFFFFFFF)),
        elevation: const WidgetStatePropertyAll(0),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(color: Color(0xFF1F2A4A)),
        ),
      ),

      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) =>
            const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'inter',
      dividerColor: const Color(0xFF32415F),
      scaffoldBackgroundColor: const Color(0xFF1B2232),
      // scaffoldBackgroundColor: Color(0xFF10141E),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF7EA6FF),
        surface: Color(0xFF1B2232),
        onSurface: Color(0xFFF1F5FF),
        onSurfaceVariant: Color(0xFFB6C2E1),
        surfaceContainerHigh: Color(0xFF26324A),
        outline: Color(0xFF32415F),
        outlineVariant: Color(0xFF32415F),
        primaryContainer: Color(0xFF324677),
        onPrimaryContainer: Color(0xFFDCE5FF),
        error: Color(0xFFFFB4AB), // A softer, readable pastel red
        onError: Color(0xFF690005),
        errorContainer: Color(0xFF93000A),
        onErrorContainer: Color(0xFFFFDAD6),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1B2232),
      ),

      searchBarTheme: const SearchBarThemeData(
        // The elevated dark slate background
        backgroundColor: WidgetStatePropertyAll(Color(0xFF26324A)),
        elevation: WidgetStatePropertyAll(1),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xFFF1F5FF))),
      ),

      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) =>
            const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02),
      ),
    );
  }
}
