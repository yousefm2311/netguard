import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF5D5FEF); // Vibrant blue/purple from design
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColorLight = Color(0xFFF7F8FA);
  static const Color backgroundColorDark = Color(0xFF121212);
  static const Color surfaceColorLight = Colors.white;
  static const Color surfaceColorDark = Color(0xFF1E1E1E);
  
  static const Color textPrimaryLight = Color(0xFF1A1D1E);
  static const Color textSecondaryLight = Color(0xFF6B7280);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColorLight,
    ),
    scaffoldBackgroundColor: backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColorLight,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: textPrimaryLight),
      titleTextStyle: TextStyle(
        color: textPrimaryLight,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColorLight,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 1), // subtle border
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: textPrimaryLight, fontWeight: FontWeight.bold, fontSize: 24),
      titleLarge: TextStyle(color: textPrimaryLight, fontWeight: FontWeight.bold, fontSize: 20),
      titleMedium: TextStyle(color: textPrimaryLight, fontWeight: FontWeight.w600, fontSize: 16),
      bodyLarge: TextStyle(color: textPrimaryLight, fontSize: 16),
      bodyMedium: TextStyle(color: textSecondaryLight, fontSize: 14),
      bodySmall: TextStyle(color: textSecondaryLight, fontSize: 12),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColorDark,
    ),
    scaffoldBackgroundColor: backgroundColorDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColorDark,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColorDark,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF374151), width: 1),
      ),
    ),
  );
}
