import 'dart:async';

import 'package:l/l.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/utils/logger_util.dart';
import 'package:poem/src/features/app/logic/app_runner.dart';
import 'package:poem/src/features/dependencies/logic/initialization_processor.dart';
import 'package:poem/src/features/dependencies/model/initialization_hook.dart';
import 'package:poem/src/features/dependencies/model/initialization_result.dart';

void main() {
  final hook = InitializationHook.setup(
    onInitializing: _onInitializing,
    onInitialized: _onInitialized,
    onError: _onError,
    onInit: _onInit,
  );

  l.capture(
    () => runZonedGuarded(
      () => AppRunner().initializeAndRun(
        hook,
      ),
      ErrorUtil.logError,
    ),
    const LogOptions(
      messageFormatting: LoggerUtil.messageFormatting,
    ),
  );
}

void _onInitializing(InitializationStepInfo info) => l.i(
      'Inited ${info.stepName} in ${info.msSpent} ms | '
      'Progress: ${((info.step / info.stepsCount) * 100).toInt()}%',
    );

void _onInitialized(InitializationResult result) => l.i(
      'Initialization completed successfully in ${result.msSpent} ms',
    );

void _onError(int step, Object error) => ErrorUtil.logError(
      error,
      StackTrace.fromString('Initialization failed on step $step'),
      fatal: true,
    );

void _onInit() => l.i(
      'Initialization started',
    );
