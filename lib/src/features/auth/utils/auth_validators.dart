import 'package:flutter/material.dart';

/// {@template auth_validators}
/// Validators for authentication inputs.
/// {@endtemplate}
abstract class AuthValidators {
  static const String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Validates the email input.
  ///
  /// - If the email is null or empty, it returns an error message.
  /// - If the email does not match the regex pattern, it returns an error message.
  static String? validateEmail(
    BuildContext context,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Введите электронную почту'; // TODO: Localize
    }

    final emailRegex = RegExp(_emailPattern);

    if (!emailRegex.hasMatch(value)) {
      return 'Введите корректный адрес электронной почты'; // TODO: Localize
    }

    return null;
  }

  /// Validates the password input.
  ///
  /// - If the password is null or empty, it returns an error message.
  /// - If the password length is less than 6 characters, it returns an error message.
  static String? validatePassword(
    BuildContext context,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль'; // TODO: Localize
    }

    if (value.length < 6) {
      return 'Пароль должен содержать не менее 6 символов'; // TODO: Localize
    }

    return null;
  }

  /// Validates the username input.
  ///
  /// - If the username is null or empty, it returns an error message.
  /// - If the username length is less than 3 characters, it returns an error message.
  /// - If the username length is greater than 20 characters, it returns an error message.
  /// - If the username contains invalid characters, it returns an error message.
  static String? validateUsername(
    BuildContext context,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Введите имя пользователя'; // TODO: Localize
    }

    if (value.length < 3) {
      return 'Имя пользователя должно содержать не менее 3 символов'; // TODO: Localize
    }

    if (value.length > 20) {
      return 'Имя пользователя должно содержать не более 20 символов'; // TODO: Localize
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

    if (!usernameRegex.hasMatch(value)) {
      return 'Имя пользователя может содержать только буквы, цифры и символ подчеркивания'; // TODO: Localize
    }

    return null;
  }
}
