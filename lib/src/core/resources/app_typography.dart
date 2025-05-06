// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

/// {@template app_typography}
/// Typography used in the app
/// {@endtemplate}
class AppTypography extends ThemeExtension<AppTypography> {
  /// Display Large
  final TextStyle displayLarge;

  /// Display Medium
  final TextStyle displayMedium;

  /// Display Small
  final TextStyle displaySmall;

  /// Headline Large
  final TextStyle headlineLarge;

  /// Headline Medium
  final TextStyle headlineMedium;

  /// Headline Small
  final TextStyle headlineSmall;

  /// Title Large
  final TextStyle titleLarge;

  /// Title Medium
  final TextStyle titleMedium;

  /// Title Small
  final TextStyle titleSmall;

  /// Label Large
  final TextStyle labelLarge;

  /// Label Medium
  final TextStyle labelMedium;

  /// Label Small
  final TextStyle labelSmall;

  /// Body Large
  final TextStyle bodyLarge;

  /// Body Medium
  final TextStyle bodyMedium;

  /// Body Small
  final TextStyle bodySmall;

  /// {@macro app_typography}
  const AppTypography({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) =>
      AppTypography(
        displayLarge: displayLarge ?? this.displayLarge,
        displayMedium: displayMedium ?? this.displayMedium,
        displaySmall: displaySmall ?? this.displaySmall,
        headlineLarge: headlineLarge ?? this.headlineLarge,
        headlineMedium: headlineMedium ?? this.headlineMedium,
        headlineSmall: headlineSmall ?? this.headlineSmall,
        titleSmall: titleSmall ?? this.titleSmall,
        titleLarge: titleLarge ?? this.titleLarge,
        titleMedium: titleMedium ?? this.titleMedium,
        labelLarge: labelLarge ?? this.labelLarge,
        labelMedium: labelMedium ?? this.labelMedium,
        labelSmall: labelSmall ?? this.labelSmall,
        bodyLarge: bodyLarge ?? this.bodyLarge,
        bodyMedium: bodyMedium ?? this.bodyMedium,
        bodySmall: bodySmall ?? this.bodySmall,
      );

  @override
  ThemeExtension<AppTypography> lerp(
    AppTypography? other,
    double t,
  ) {
    if (other == null) return this;

    return AppTypography(
      displayLarge:
          TextStyle.lerp(displayLarge, other.displayLarge, t) ?? displayLarge,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t) ??
          displayMedium,
      displaySmall:
          TextStyle.lerp(displaySmall, other.displaySmall, t) ?? displaySmall,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t) ??
          headlineLarge,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t) ??
          headlineMedium,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t) ??
          headlineSmall,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t) ?? titleLarge,
      titleMedium:
          TextStyle.lerp(titleMedium, other.titleMedium, t) ?? titleMedium,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t) ?? titleSmall,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t) ?? labelLarge,
      labelMedium:
          TextStyle.lerp(labelMedium, other.labelMedium, t) ?? labelMedium,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t) ?? labelSmall,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t) ?? bodyLarge,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t) ?? bodyMedium,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t) ?? bodySmall,
    );
  }

  static const String? _defaultFontFamily = null;

  /// Default typography used in the app
  static const defaultTypography = AppTypography(
    displayLarge: TextStyle(
      fontSize: 57,
      height: 64 / 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -.25,
      fontFamily: _defaultFontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      height: 52 / 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamily: _defaultFontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      height: 45 / 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamily: _defaultFontFamily,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
      fontFamily: _defaultFontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      height: 36 / 28,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      fontFamily: _defaultFontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      fontFamily: _defaultFontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: .15,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: .1,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: .1,
      fontWeight: FontWeight.w500,
      fontFamily: _defaultFontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: .5,
      fontWeight: FontWeight.w500,
      fontFamily: _defaultFontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 16 / 11,
      letterSpacing: .5,
      fontWeight: FontWeight.w500,
      fontFamily: _defaultFontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.normal,
      fontFamily: _defaultFontFamily,
    ),
  );
}
