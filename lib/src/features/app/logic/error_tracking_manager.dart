import 'dart:async';

import 'package:l/l.dart';
import 'package:pure/pure.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_transform/stream_transform.dart';

/// {@template error_tracking_disabler}
/// An interface for disabling error tracking.
/// {@endtemplate}
abstract class ErrorTrackingDisabler {
  /// Disables error tracking.
  Future<void> disableReporting();
}

/// {@template error_tracking_manager}
/// An interface for managing error tracking.
/// {@endtemplate}
abstract class ErrorTrackingManager implements ErrorTrackingDisabler {
  /// Enables error reporting.
  Future<void> enableReporting({
    required bool shouldSend,
  });
}

typedef _CompleteSubscription = void Function([StreamSubscription<void>? subscription]);

/// {@template sentry_tracking_manager}
/// A class which is responsible for managing Sentry error tracking.
/// {@endtemplate}
class SentryTrackingManager implements ErrorTrackingManager {
  final String _sentryDsn;

  /// {@macro sentry_tracking_manager}
  SentryTrackingManager({
    required String sentryDsn,
  }) : _sentryDsn = sentryDsn;

  Completer<StreamSubscription<void>?>? _subscriptionCompleter;

  // ignore: unused_element
  static Stream<LogMessageError> get _warningsAndErrors => l.where(_isWarningOrError).whereType<LogMessageError>();

  static bool _true() => true;
  static bool _false() => false;

  static bool _isWarningOrError(LogMessage message) => message.level.maybeWhen(
        warning: _true,
        error: _true,
        orElse: _false,
      );

  static Future<SentryId> _captureException(
    LogMessageError message,
  ) =>
      Sentry.captureException(
        message.message,
        stackTrace: message.stackTrace,
      );

  Future<void> _onFirstCall(
    Future<void> Function(_CompleteSubscription complete) body,
  ) async {
    if (_subscriptionCompleter == null) {
      final completer = _subscriptionCompleter = Completer();
      try {
        await body(completer.complete);
      } on Object {
        completer.complete();
        rethrow;
      }
    } else {
      await _subscriptionCompleter?.future;
    }
  }

  Future<void> _initSentry(
    bool shouldSend,
    _CompleteSubscription complete,
  ) async {
    if (_sentryDsn.isNotEmpty && shouldSend) {
      await SentryFlutter.init(
        (options) => options
          ..dsn = _sentryDsn
          ..tracesSampleRate = 1,
      );
      complete(
        _warningsAndErrors.asyncMap(_captureException).listen(null.constant),
      );
    } else {
      complete();
    }
  }

  @override
  Future<void> enableReporting({required bool shouldSend}) => _onFirstCall(
        _initSentry.curry(shouldSend),
      );

  @override
  Future<void> disableReporting() async {
    final subscription = await _subscriptionCompleter?.future;
    if (subscription == null) {
      l.w(
        'Tried disabling error reporting when '
        'it was not enabled in the first place.',
      );
    } else {
      await subscription.cancel();
    }
  }
}
