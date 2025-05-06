import 'package:flutter/cupertino.dart';
import 'package:l/l.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart';

/// {@template logger_util}
/// Utility class for logging.
/// {@endtemplate}
abstract class LoggerUtil {
  /// Formats the log message.
  static Object messageFormatting(
    Object message, [
    LogLevel? logLevel,
    DateTime? now,
  ]) {
    final logLevelString = logLevel != null ? logLevel.emoji : '';
    final dateTime = now != null ? timeFormat(now) : '';

    return '$logLevelString $dateTime $message';
  }

  /// Formats the time.
  static String timeFormat(DateTime time) =>
      '${time.hour}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}.${time.millisecond.toString().padLeft(3, '0')}';

  /// Logs the message.
  static void log(
    Object message, {
    LogLevel logLevel = const LogLevel.info(),
    Object? name,
    Object? domain,
  }) {
    final stringBuffer = StringBuffer();

    if (domain != null) stringBuffer.write('$domain | ');
    if (name != null) stringBuffer.write('$name | ');

    stringBuffer.write(message);
    final updatedMessage = stringBuffer.toString();

    return logLevel.when<void>(
      shout: () => l.s(updatedMessage),
      v: () => l.v(updatedMessage),
      error: () => l.e(updatedMessage),
      vv: () => l.vv(updatedMessage),
      warning: () => l.w(updatedMessage),
      vvv: () => l.vvv(updatedMessage),
      info: () => l.i(updatedMessage),
      vvvv: () => l.vvvv(updatedMessage),
      debug: () => l.d(updatedMessage),
      vvvvv: () => l.vvvvv(updatedMessage),
      vvvvvv: () => l.vvvvvv(updatedMessage),
    );
  }

  /// Formats the error.
  static String _formatError(
    String type,
    String error,
    StackTrace? stackTrace,
  ) {
    final trace = stackTrace ?? StackTrace.current;

    final buffer = StringBuffer(type)
      ..write(' error: ')
      ..writeln(error)
      ..writeln('Stack trace:')
      ..write(Trace.from(trace).terse);

    return buffer.toString();
  }

  /// Logs the Flutter error.
  static void logFlutterError(
    FlutterErrorDetails details,
  ) {
    final stack = details.stack;
    l.e(
      messageFormatting(
        _formatError(details.exception.runtimeType.toString(), details.exceptionAsString(), stack),
        const LogLevel.error(),
        DateTime.now(),
      ),
      stack,
    );
    Sentry.captureException(details.exception, stackTrace: stack).ignore();
  }

  /// Logs the platform dispatcher error.
  static bool logPlatformDispatcherError(
    Object error,
    StackTrace stackTrace,
  ) {
    l.e(
      messageFormatting(
        _formatError(error.runtimeType.toString(), error.toString(), stackTrace),
        const LogLevel.error(),
        DateTime.now(),
      ),
      stackTrace,
    );
    Sentry.captureException(error, stackTrace: stackTrace).ignore();
    return true;
  }
}

extension on LogLevel {
  String get emoji => maybeWhen(
        shout: () => '🚨',
        error: () => '❌',
        warning: () => '⚠️',
        info: () => 'ℹ️',
        debug: () => '🐞',
        orElse: () => '🤷‍♂️',
      );
}
