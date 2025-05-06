import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:poem/src/core/localization/localization.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';
import 'package:poem/src/features/auth/model/user.dart';
import 'package:poem/src/features/auth/widget/auth_scope.dart';
import 'package:poem/src/features/dependencies/model/dependencies.dart';
import 'package:poem/src/features/dependencies/widget/dependencies_scope.dart';

/// A [BuildContext] extension.
extension BuildContextX on BuildContext {
  /// Get the dependencies from the [BuildContext].
  Dependencies get dependencies => DependenciesScope.of(this);

  /// Get the shared preferences from the [BuildContext].
  SharedPreferences get sharedPreferences => dependencies.sharedPreferences;

  /// Get the [Localization] from the [BuildContext].
  Localization get localized => Localization.of(this);

  /// Get the [User] from the [BuildContext].
  User? get user => AuthScope.userOf(this);

  /// Get the [MediaQueryData] from the [BuildContext].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the view padding from the [BuildContext].
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Get the [ThemeData] from the [BuildContext].
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Get the [ThemeData] from the [BuildContext].
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get the [ThemeData] from the [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Get the [AppTypography] from the [BuildContext].
  AppTypography get typography => theme.extension<AppTypography>()!;

  /// Get the [AppColors] from the [BuildContext].
  AppColors get colors => theme.extension<AppColors>()!;

  /// Get the [Brightness] from the [BuildContext].
  Brightness get brightness => theme.brightness;

  /// Get the [T] from the [BuildContext] or null.
  /// If [listen] is `true` then it will listen to the changes.
  T? inhMaybeOf<T extends InheritedWidget>({
    bool listen = true,
  }) =>
      listen
          ? dependOnInheritedWidgetOfExactType<T>()
          : getInheritedWidgetOfExactType<T>();

  /// Get the [T] from the [BuildContext] by [aspect] or null.
  /// If [aspect] is not null then it will listen to the changes.
  T? inhMaybeAspectOf<T extends InheritedWidget>({
    Object? aspect,
  }) =>
      aspect != null
          ? dependOnInheritedWidgetOfExactType<T>(aspect: aspect) //
          : getInheritedWidgetOfExactType<T>();

  /// Get the [T] from the [BuildContext] or throw an [ArgumentError].
  T inhOf<T extends InheritedWidget>({
    bool listen = true,
  }) =>
      inhMaybeOf<T>(listen: listen) ??
      (throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a $T of the exact type',
        'out_of_scope',
      ));

  /// Get the [T] from the [BuildContext] by [aspect] or throw an [ArgumentError].
  T inhAspectOf<T extends InheritedWidget>({
    Object? aspect,
  }) =>
      inhMaybeAspectOf<T>(aspect: aspect) ??
      (throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a $T of the exact type with aspect $aspect',
        'out_of_scope',
      ));

  /// Get the [T] from the [BuildContext] by [aspect] or throw an [ArgumentError].
  T? inhFrom<T extends InheritedModel<Object>>(
    Object aspect,
  ) =>
      InheritedModel.inheritFrom<T>(
        this,
        aspect: aspect,
      );
}
