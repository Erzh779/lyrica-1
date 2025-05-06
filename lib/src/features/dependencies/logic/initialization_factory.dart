part of 'initialization_processor.dart';

/// {@template initialization_factory}
/// An interface for creating dependencies.
/// {@endtemplate}
abstract class InitializationFactory {
  /// Creates an environment storage.
  IEnvironmentStorage createEnvironmentStorage();

  /// Creates an error tracking manager.
  ErrorTrackingManager createErrorTrackingManager(
    IEnvironmentStorage environmentStorage,
  );
}

/// {@template initialization_factory_impl}
/// An implementation of [InitializationFactory].
/// {@endtemplate}
mixin InitializationFactoryImpl implements InitializationFactory {
  @override
  IEnvironmentStorage createEnvironmentStorage() => const EnvironmentStorage();

  @override
  ErrorTrackingManager createErrorTrackingManager(
    IEnvironmentStorage environmentStorage,
  ) =>
      SentryTrackingManager(
        sentryDsn: environmentStorage.sentryDsn,
      );
}
