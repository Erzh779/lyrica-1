import 'dart:async';
import 'dart:ui';

import 'package:control/control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:poem/src/core/control/controller_observer.dart';
import 'package:poem/src/core/utils/logger_util.dart';
import 'package:poem/src/features/app/widget/app.dart';
import 'package:poem/src/features/dependencies/logic/initialization_processor.dart';
import 'package:poem/src/features/dependencies/logic/initialization_steps.dart';
import 'package:poem/src/features/dependencies/model/initialization_hook.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner with InitializationSteps, InitializationProcessor, InitializationFactoryImpl {
  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun(InitializationHook hook) async {
    // Ensure that the widgets binding is initialized. This is required for the splash screen.
    final bindings = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

    // Preserve splash screen. It will be removed after the first frame is rendered.
    FlutterNativeSplash.preserve(widgetsBinding: bindings);

    // Override logging
    FlutterError.onError = LoggerUtil.logFlutterError;
    PlatformDispatcher.instance.onError = LoggerUtil.logPlatformDispatcherError;

    Controller.observer = ControllerObserver();

    try {
      // Initialize the app
      final result = await processInitialization(
        factory: this,
        steps: initializationSteps,
        hook: hook,
      );

      // Allow the first frame to be rendered
      FlutterNativeSplash.remove();
      bindings.allowFirstFrame();

      // Attach this widget to the root of the tree.
      PoemApp(result: result).attach();
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    }
  }
}
