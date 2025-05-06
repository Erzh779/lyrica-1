import 'package:flutter/material.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';

/// {@template theme_extension}
/// ThemeX extension to get the [AppColors] and [AppTypography] from the [ThemeData].
/// {@endtemplate}
extension ThemeX on ThemeData {
  /// Get the [AppColors] from the [ThemeData].
  AppColors get colors => extension<AppColors>()!;

  /// Get the [AppTypography] from the [ThemeData].
  AppTypography get appTypography => extension<AppTypography>()!;
}
