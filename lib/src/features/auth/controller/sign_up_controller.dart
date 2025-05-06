// ignore_for_file: invalid_annotation_target

import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poem/src/features/auth/data/auth_repository.dart';

part 'sign_up_controller.freezed.dart';

/// {@template sign_up_controller}
/// Sign up controller
/// {@endtemplate}
final class SignUpController extends StateController<SignUpState>
    with SequentialControllerHandler {
  /// {@macro sign_up_controller}
  SignUpController({
    required IAuthRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IAuthRepository _repository;

  /// Sign up with email and password
  void signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) =>
      handle(
        name: 'SignUp',
        () async {
          setState(
            SignUpState.processing(),
          );

          await _repository.signUpWithEmailAndPassword(
            username: username,
            email: email,
            password: password,
          );

          setState(
            SignUpState.successful(
              email: email,
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          SignUpState.idle(
            error: error,
          ),
        ),
        done: () async => setState(
          SignUpState.idle(
            error: null,
          ),
        ),
      );
}

/// SignUpState data class
@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();

  /// Idle state
  const factory SignUpState.idle({
    required Object? error,
  }) = SignUpState$Idle;

  /// Processing state
  const factory SignUpState.processing() = SignUpState$Processing;

  /// Successful state
  const factory SignUpState.successful({
    required String email,
  }) = SignUpState$Successful;

  /// Error
  Object? get error => mapOrNull(
        idle: (state) => state.error,
      );

  /// Is processing
  bool get isProcessing => maybeMap(
        processing: (_) => true,
        orElse: () => false,
      );

  /// Is successful
  bool get isSuccessful => maybeMap(
        successful: (_) => true,
        orElse: () => false,
      );

  /// Is idling
  bool get isIdling => maybeMap(
        idle: (_) => true,
        orElse: () => false,
      );

  /// Get email
  String? get email => maybeMap(
        successful: (state) => state.email,
        orElse: () => null,
      );
}
