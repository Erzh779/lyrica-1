import 'dart:async';

import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/features/auth/data/auth_repository.dart';
import 'package:poem/src/features/auth/model/user.dart';

part 'auth_controller.freezed.dart';

/// {@template auth_controller}
/// Auth controller
/// {@endtemplate}
final class AuthController extends StateController<AuthState>
    with SequentialControllerHandler {
  final IAuthRepository _repository;

  StreamSubscription<AuthState>? _userSubscription;

  /// {@macro auth_controller}
  AuthController({
    required final IAuthRepository repository,
    required super.initialState,
  }) : _repository = repository {
    _userSubscription = _repository.userChanges().map(_mapUserToState).listen(
          setState,
        );
  }

  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  AuthState _mapUserToState(final User user) => AuthState.idle(
        user: user,
      );

  /// Restore user
  void restore() => handle(
        name: 'Restore',
        () async {
          setState(
            AuthState.processing(
              user: state.user,
            ),
          );

          final result = await _repository.restore();

          setState(
            AuthState.successful(
              user: result,
            ),
          );
        },
      );

  /// Sign in with email and password
  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      handle(
        name: 'SignInWithEmailAndPassword',
        () async {
          setState(
            AuthState.processing(
              user: state.user,
            ),
          );

          final result = await _repository.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          setState(
            AuthState.successful(
              user: result,
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          AuthState.idle(
            user: state.user,
            error: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          AuthState.idle(
            user: state.user,
          ),
        ),
      );

  /// Sign out
  void signOut() => handle(
        name: 'SignOut',
        () => _repository.signOut(),
        error: (error, stackTrace) async => setState(
          AuthState.idle(
            user: state.user,
            error: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          AuthState.idle(
            user: state.user,
          ),
        ),
      );
}

/// Auth state
@freezed
class AuthState with _$AuthState {
  const AuthState._();

  /// Idling state
  const factory AuthState.idle({
    required final User user,
    @Default('Idle') final String message,
    final String? error,
  }) = AuthStateIdle;

  /// Processing
  const factory AuthState.processing({
    required final User user,
    @Default('Processing') final String message,
  }) = AuthStateProcessing;

  /// Successful
  const factory AuthState.successful({
    required final User user,
    @Default('Successful') final String message,
  }) = AuthStateSuccessful;

  /// If an error has occurred
  bool get hasError =>
      maybeMap<bool>(orElse: () => false, idle: (state) => state.error != null);

  /// Get error message
  String? get error => mapOrNull(idle: (state) => state.error);

  /// Is in idle state
  bool get isIdling => !isProcessing;

  /// Is in progress state
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);
}
