import 'package:flutter/material.dart';

/// {@template app_colors}
/// Colors used in the app
/// {@endtemplate}
class AppColors extends ThemeExtension<AppColors> {
  /// Main blue color
  final Color primary;

  /// Hover state for primary
  final Color primaryHover;

  /// Pressed state for primary
  final Color primaryPressed;

  /// Accent orange color
  final Color accent;

  /// Background color
  final Color background;

  /// Surface color (light block background)
  final Color surface;

  /// Text color on primary
  final Color onPrimary;

  /// Main text color on background
  final Color onBackground;

  // Gray gradient

  /// Darkest gray color
  final Color gray900;

  /// Dark gray color
  final Color gray700;

  /// Medium gray color
  final Color gray500;

  /// Light gray color
  final Color gray300;

  /// Lightest gray color
  final Color gray100;

  /// Almost white gray color
  /// (used for light backgrounds)
  final Color gray50;

  /// Error color
  final Color error;

  /// Text color on error background
  final Color onError;

  /// Light borders
  final Color outline;

  /// Light shadow
  final Color shadow;

  /// {@macro app_colors}
  const AppColors({
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.accent,
    required this.background,
    required this.surface,
    required this.onPrimary,
    required this.onBackground,
    required this.gray900,
    required this.gray700,
    required this.gray500,
    required this.gray300,
    required this.gray100,
    required this.gray50,
    required this.error,
    required this.onError,
    required this.outline,
    required this.shadow,
  });

  /// Light color scheme
  static const light = AppColors(
    primary: Color(0xFF006ADC),
    primaryHover: Color(0xFF0051B5),
    primaryPressed: Color(0xFF00429C),
    accent: Color(0xFFFF8A00),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF9FAFB),
    onPrimary: Color(0xFFFFFFFF),
    onBackground: Color(0xFF0F172A),
    gray900: Color(0xFF0F172A),
    gray700: Color(0xFF334155),
    gray500: Color(0xFF64748B),
    gray300: Color(0xFFCBD5E1),
    gray100: Color(0xFFF1F5F9),
    gray50: Color(0xFFF9FAFB),
    error: Color(0xFFEF4444),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFFE2E8F0),
    shadow: Color(0x1A000000),
  );

  /// Dark color scheme
  static const dark = AppColors(
    primary: Color(0xFF006ADC),
    primaryHover: Color(0xFF0051B5),
    primaryPressed: Color(0xFF00429C),
    accent: Color(0xFFFF8A00),
    background: Color(0xFF0F172A),
    surface: Color(0xFF1E293B),
    onPrimary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFF9FAFB),
    gray900: Color(0xFFF9FAFB),
    gray700: Color(0xFFCBD5E1),
    gray500: Color(0xFF94A3B8),
    gray300: Color(0xFF64748B),
    gray100: Color(0xFF334155),
    gray50: Color(0xFF1E293B),
    error: Color(0xFFEF4444),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFF334155),
    shadow: Color(0x1A000000),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryPressed,
    Color? accent,
    Color? background,
    Color? surface,
    Color? onPrimary,
    Color? onBackground,
    Color? gray900,
    Color? gray700,
    Color? gray500,
    Color? gray300,
    Color? gray100,
    Color? gray50,
    Color? error,
    Color? onError,
    Color? outline,
    Color? shadow,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onPrimary: onPrimary ?? this.onPrimary,
      onBackground: onBackground ?? this.onBackground,
      gray900: gray900 ?? this.gray900,
      gray700: gray700 ?? this.gray700,
      gray500: gray500 ?? this.gray500,
      gray300: gray300 ?? this.gray300,
      gray100: gray100 ?? this.gray100,
      gray50: gray50 ?? this.gray50,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      outline: outline ?? this.outline,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(covariant AppColors? other, double t) {
    if (other == null) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primaryHover:
          Color.lerp(primaryHover, other.primaryHover, t) ?? primaryHover,
      primaryPressed:
          Color.lerp(primaryPressed, other.primaryPressed, t) ?? primaryPressed,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      onBackground:
          Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
      gray900: Color.lerp(gray900, other.gray900, t) ?? gray900,
      gray700: Color.lerp(gray700, other.gray700, t) ?? gray700,
      gray500: Color.lerp(gray500, other.gray500, t) ?? gray500,
      gray300: Color.lerp(gray300, other.gray300, t) ?? gray300,
      gray100: Color.lerp(gray100, other.gray100, t) ?? gray100,
      gray50: Color.lerp(gray50, other.gray50, t) ?? gray50,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      outline: Color.lerp(outline, other.outline, t) ?? outline,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
    );
  }
}
