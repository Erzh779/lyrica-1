import 'package:poem/src/features/app/logic/error_tracking_manager.dart';
import 'package:poem/src/features/auth/controller/auth_controller.dart';
import 'package:poem/src/features/auth/data/auth_repository.dart';
import 'package:poem/src/features/music/data/music_repository.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  /// Error tracking manager
  late final ErrorTrackingDisabler errorTrackingDisabler;

  /// Shared preferences
  late final SharedPreferences sharedPreferences;

  /// Auth repository
  late final IAuthRepository authRepository;

  /// Auth controller
  late final AuthController authController;

  /// Poems repository
  late final IPoemsRepository poemsRepository;

  /// Music repository
  late final IMusicRepository musicRepository;
}
