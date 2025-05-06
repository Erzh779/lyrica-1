import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poem/src/features/auth/data/auth_repository.dart';

part 'forgot_password_controller.freezed.dart';

/// {@template forgot_password_controller}
/// Forgot password controller
/// {@endtemplate}
final class ForgotPasswordController
    extends StateController<ForgotPasswordState>
    with SequentialControllerHandler {
  /// {@macro forgot_password_controller}
  ForgotPasswordController({
    required IAuthRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IAuthRepository _repository;

  /// Reset password for email
  void resetPasswordForEmail({
    required String email,
  }) =>
      handle(
        name: 'ResetPasswordForEmail',
        () async {
          setState(
            const ForgotPasswordState.processing(),
          );

          await _repository.resetPasswordForEmail(
            email: email,
          );

          setState(
            const ForgotPasswordState.successful(),
          );
        },
        error: (error, stackTrace) async => setState(
          ForgotPasswordState.idle(
            error: error,
          ),
        ),
        done: () async => setState(
          const ForgotPasswordState.idle(
            error: null,
          ),
        ),
      );
}

/// OtpVerficationController data class
@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  /// Idle state
  const factory ForgotPasswordState.idle({
    required Object? error,
  }) = ForgotPasswordState$Idle;

  /// Processing state
  const factory ForgotPasswordState.processing() =
      ForgotPasswordState$Processing;

  /// Successful state
  const factory ForgotPasswordState.successful() =
      ForgotPasswordState$Successful;

  /// Is Processing
  bool get isProcessing => maybeMap<bool>(
        processing: (_) => true,
        orElse: () => false,
      );

  /// Get error
  Object? get error => mapOrNull(
        idle: (state) => state.error,
      );
}
