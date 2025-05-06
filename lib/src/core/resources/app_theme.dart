import 'package:flutter/material.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';

/// {@template app_theme}
/// AppTheme class. Contains theme data.
/// {@endtemplate}
class AppTheme {
  static const _defaultBorderRadius = BorderRadius.all(Radius.circular(8));

  /// Light theme
  static final light = createThemeData(
    brightness: Brightness.light,
    colors: AppColors.light,
    typography: AppTypography.defaultTypography,
  );

  /// Dark theme
  static final dark = createThemeData(
    brightness: Brightness.dark,
    colors: AppColors.dark,
    typography: AppTypography.defaultTypography,
  );

  static ThemeData createThemeData({
    required Brightness brightness,
    required AppColors colors,
    required AppTypography typography,
  }) =>
      ThemeData(
        brightness: brightness,
        iconTheme: IconThemeData(
          color: colors.primary,
        ),
        dividerColor: colors.gray300,
        primaryColor: colors.primary,
        primaryColorDark: colors.primary,
        primaryColorLight: colors.primary,
        scaffoldBackgroundColor: colors.background,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: brightness,
          primary: colors.primary,
          secondary: colors.accent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: typography.titleSmall.copyWith(
            color: colors.onBackground,
          ),
          hintStyle: typography.titleSmall.copyWith(
            color: colors.onBackground,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: colors.surface,
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: _defaultBorderRadius,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.outline,
            ),
            borderRadius: _defaultBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.outline,
            ),
            borderRadius: _defaultBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.primary,
            ),
            borderRadius: _defaultBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.error,
            ),
            borderRadius: _defaultBorderRadius,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.background,
          foregroundColor: colors.primary,
          elevation: 0,
          actionsIconTheme: IconThemeData(
            color: colors.primary,
            size: 24,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: colors.primary,
          ),
          titleTextStyle: typography.headlineSmall.copyWith(
            color: colors.onBackground,
          ),
        ),
        extensions: [
          colors,
          typography,
        ],
      );
}
