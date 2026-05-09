import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primary = Color(0xFF0056C3);
  static const Color _secondary = Color(0xFF00A6A6);
  static const Color _accent = Color(0xFFFFA63D);
  static const Color _lightScaffold = Color(0xFFF4F7FB);
  static const Color _darkScaffold = Color(0xFF081120);

  static ThemeData light() {
    return _buildTheme(
      brightness: Brightness.light,
      scaffold: _lightScaffold,
      surface: Colors.white,
      onSurface: const Color(0xFF151B2C),
      outline: const Color(0xFFD8E0ED),
    );
  }

  static ThemeData dark() {
    return _buildTheme(
      brightness: Brightness.dark,
      scaffold: _darkScaffold,
      surface: const Color(0xFF111C2E),
      onSurface: const Color(0xFFF3F7FF),
      outline: const Color(0xFF27344D),
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color scaffold,
    required Color surface,
    required Color onSurface,
    required Color outline,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      brightness: brightness,
      primary: _primary,
      secondary: _secondary,
      tertiary: _accent,
      surface: surface,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffold,
      textTheme: GoogleFonts.ibmPlexSansArabicTextTheme().apply(
        bodyColor: onSurface,
        displayColor: onSurface,
      ),
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: onSurface,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: outline),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: _primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          backgroundColor: _primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: _primary,
        unselectedItemColor: onSurface.withValues(alpha: 0.56),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(
          brightness == Brightness.dark ? Colors.white : _primary,
        ),
      ),
    );
  }
}
