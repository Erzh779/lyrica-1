import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart' show BuildContext, ScaffoldMessenger;
import 'package:l/l.dart';
import 'package:poem/src/core/exceptions/auth_exceptions.dart';
import 'package:poem/src/core/localization/localization.dart';
import 'package:poem/src/core/utils/error_util_vm.dart';
import 'package:poem/src/core/widget/error_snackbar.dart';

/// Error util.
abstract class ErrorUtil {
  /// Logs an error to the console and to Crashlytics/Sentry.
  static Future<void> logError(
    Object exception,
    StackTrace stackTrace, {
    String? hint,
    bool fatal = false,
  }) async {
    try {
      if (exception is String) {
        return await logMessage(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          warning: true,
        );
      }
      $captureException(exception, stackTrace, hint, fatal).ignore();
      l.e(exception, stackTrace);
    } on Object catch (error, stackTrace) {
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logError',
        stackTrace,
      );
    }
  }

  /// Logs a message to the console and to Crashlytics/Sentry.
  static Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
    String? hint,
    bool warning = false,
  }) async {
    try {
      l.e(message, stackTrace ?? StackTrace.current);
      $captureMessage(message, stackTrace, hint, warning).ignore();
    } on Object catch (error, stackTrace) {
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logMessage',
        stackTrace,
      );
    }
  }

  /// Rethrows the error with the stack trace.
  static Never throwWithStackTrace(
    Object error,
    StackTrace stackTrace,
  ) =>
      Error.throwWithStackTrace(error, stackTrace);

  @pragma('vm:prefer-inline')
  static String _localizedError(
    String fallback,
    String Function(Localization l) localize, [
    String? code,
  ]) {
    String value;

    try {
      value = localize(Localization.current);
    } on Object {
      value = fallback;
    }

    return code != null ? '$value ($code)' : value;
  }

  /// Also we can add current localization to this method
  static String formatMessage(
    Object error, [
    String fallback = 'An error has occurred',
  ]) =>
      switch (error) {
        String e => e,
        FormatException _ => _localizedError(
            'Invalid format',
            (l) => l.errorInvalidFormat,
            '001',
          ),
        TimeoutException _ => _localizedError(
            'Timeout exceeded',
            (l) => l.errorTimeoutExceeded,
            '002',
          ),
        UnimplementedError _ => _localizedError(
            'Unimplemented operation',
            (l) => l.errorUnimplementedError,
            '003',
          ),
        UnsupportedError _ => _localizedError(
            'Unsupported operation',
            (l) => l.errorUnsupportedError,
            '004',
          ),
        FileSystemException _ => _localizedError(
            'File system error',
            (l) => l.errorFileSystemError,
            '005',
          ),
        AssertionError _ => _localizedError(
            'Assertion error',
            (l) => l.errorAssertionError,
            '006',
          ),
        TypeError e => _localizedError(
            'Type error',
            (l) => 'Type error: $e',
            '007',
          ),
        Error _ => _localizedError(
            'Error',
            (l) => l.errorUnknownError,
            '008',
          ),
        SocketException _ => _localizedError(
            'Bad internet connection',
            (l) => l.errorBadInternetConnection,
            '009',
          ),
        InvalidCredentialsException _ => _localizedError(
            'Invalid credentials',
            (l) => l.errorInvalidCredentials,
            '010',
          ),
        EmailNotConfirmedException _ => _localizedError(
            'Email not confirmed',
            (l) => l.errorEmailNotConfirmed,
            '011',
          ),
        Exception e => _localizedError(
            'Exception',
            (l) => e.toString(),
          ),
        _ => fallback,
      };

  /// Shows a error snackbar with the given message.
  static void showSnackBar(
    BuildContext context,
    Object message,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      ErrorSnackbar(
        message: formatMessage(message),
        context: context,
      ),
    );
  }
}
