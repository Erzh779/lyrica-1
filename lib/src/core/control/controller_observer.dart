import 'package:control/control.dart';
import 'package:l/l.dart';
import 'package:poem/src/core/utils/logger_util.dart';

/// {@template controller_observer}
/// A controller observer which logs controller events.
/// {@endtemplate}
class ControllerObserver implements IControllerObserver {
  @override
  void onCreate(
    Controller controller,
  ) =>
      LoggerUtil.log(
        'Controller | Created: ${controller.name}',
      );

  @override
  void onDispose(
    Controller controller,
  ) =>
      LoggerUtil.log(
        'Controller | Disposed: ${controller.name}',
      );

  @override
  void onError(
    Controller controller,
    Object error,
    StackTrace stackTrace,
  ) =>
      LoggerUtil.log(
        'Controller | Error: ${controller.name} | Error: $error | StackTrace: $stackTrace',
        logLevel: const LogLevel.error(),
      );

  @override
  void onHandler(
    HandlerContext context,
  ) =>
      LoggerUtil.log(
        'Controller | Handler: ${context.name}',
      );

  @override
  void onStateChanged<S extends Object>(
    StateController<S> controller,
    S prevState,
    S nextState,
  ) =>
      LoggerUtil.log(
        'Controller | State Changed: ${controller.name} | Prev: $prevState | Next: $nextState',
      );
}
