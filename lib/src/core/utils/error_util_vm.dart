import 'package:sentry_flutter/sentry_flutter.dart';

/// Capture exception
Future<void> $captureException(
  Object exception,
  StackTrace stackTrace,
  String? hint,
  bool fatal,
) =>
    Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      hint: Hint.withMap(
        {
          'hint': hint,
        },
      ),
    );

/// Capture message
Future<void> $captureMessage(
  String message,
  StackTrace? stackTrace,
  String? hint,
  bool warning,
) =>
    Sentry.captureMessage(
      message,
      level: warning ? SentryLevel.warning : SentryLevel.info,
      hint: Hint.withMap(
        {
          'hint': hint,
        },
      ),
      params: <String>[
        if (stackTrace != null) 'StackTrace: $stackTrace',
      ],
    );
