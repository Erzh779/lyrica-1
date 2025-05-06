import 'package:poem/src/features/dependencies/model/dependencies.dart';
import 'package:poem/src/features/dependencies/model/environment_storage.dart';

/// {@template initialization_progress}
/// A class which represents the initialization progress.
/// {@endtemplate}
final class InitializationProgress {
  /// {@macro initialization_progress}
  const InitializationProgress({
    required this.dependencies,
    required this.environmentStorage,
  });

  /// Mutable version of dependencies
  final Dependencies dependencies;

  /// Environment store
  final IEnvironmentStorage environmentStorage;
}
