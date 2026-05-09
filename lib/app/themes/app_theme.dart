import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(isDark: false);
  static ThemeData get dark  => _build(isDark: true);

  static ThemeData _build({required bool isDark}) {
    final bg       = isDark ? AppColors.bgDark        : AppColors.bgLight;
    final surface  = isDark ? AppColors.surfaceDark   : AppColors.surfaceLight;
    final primary  = isDark ? AppColors.primaryDark   : AppColors.primary;
    final text     = isDark ? AppColors.textDark      : AppColors.textLight;
    final border   = isDark ? AppColors.borderDark    : AppColors.borderLight;
    const fontFam  = 'Cairo';

    return ThemeData(
      useMaterial3: true,
      brightness:   isDark ? Brightness.dark : Brightness.light,
      fontFamily:   fontFam,
      scaffoldBackgroundColor: bg,

      colorScheme: ColorScheme(
        brightness:   isDark ? Brightness.dark : Brightness.light,
        primary:      primary,
        onPrimary:    Colors.white,
        secondary:    isDark ? AppColors.goldDark : AppColors.gold,
        onSecondary:  isDark ? AppColors.bgDark : Colors.white,
        error:        isDark ? AppColors.errorDark   : AppColors.error,
        onError:      Colors.white,
        surface:      surface,
        onSurface:    text,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor:  bg,
        surfaceTintColor: Colors.transparent,
        elevation:        0,
        scrolledUnderElevation: 0,
        iconTheme:  IconThemeData(color: text, size: AppDim.iconLg),
        titleTextStyle: AppTextStyles.lg(color: text),
        centerTitle: false,
      ),

      // Card
      cardTheme: CardThemeData(
        color:        surface,
        elevation:    0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDim.radiusXl),
          side: BorderSide(
            color: border,
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),

      // Input / TextField
      inputDecorationTheme: InputDecorationTheme(
        filled:      true,
        fillColor:   surface,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDim.s4, vertical: AppDim.s4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDim.radiusLg),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDim.radiusLg),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDim.radiusLg),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDim.radiusLg),
          borderSide: BorderSide(
              color: isDark ? AppColors.errorDark : AppColors.error),
        ),
        hintStyle: AppTextStyles.base(
            color: isDark ? AppColors.textFaintDark : AppColors.textFaintLight),
        labelStyle: AppTextStyles.sm(
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            weight: FontWeight.w600),
      ),

      // Elevated / FilledButton
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor:    primary,
          foregroundColor:    Colors.white,
          minimumSize: const Size(0, AppDim.buttonHeight),
          textStyle:   AppTextStyles.button(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDim.radiusMd)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: surface,
          foregroundColor: text,
          elevation: 0,
          minimumSize: const Size(0, AppDim.buttonHeight),
          textStyle: AppTextStyles.button(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            side: BorderSide(color: border),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size(0, AppDim.buttonHeight),
          textStyle: AppTextStyles.button(color: primary),
          side: BorderSide(color: primary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDim.radiusMd)),
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:       surface,
        selectedItemColor:     primary,
        unselectedItemColor:   isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
        selectedLabelStyle:    AppTextStyles.xs(weight: FontWeight.w600),
        unselectedLabelStyle:  AppTextStyles.xs(),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color:  border,
        space:  1,
        thickness: 1,
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? primary : null),
        trackColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
                ? primary.withValues(alpha: 0.35) : null),
      ),
    );
  }
}
