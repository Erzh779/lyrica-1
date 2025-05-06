import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poem/src/features/auth/data/auth_repository.dart';
import 'package:poem/src/features/auth/enum/verify_otp_reason.dart';

part 'otp_verification_controller.freezed.dart';

/// {@template otp_verification_controller}
/// Otp verification controller
/// {@endtemplate}
final class OtpVerificationController
    extends StateController<OtpVerificationState>
    with SequentialControllerHandler {
  /// {@macro otp_verification_controller}
  OtpVerificationController({
    required IAuthRepository repository,
    required super.initialState,
    required VerifyOtpReason reason,
  })  : _reason = reason,
        _repository = repository;

  final IAuthRepository _repository;

  /// Reason why the user is verifying the email
  final VerifyOtpReason _reason;

  /// Verify OTP
  void verifyOtp({
    required String verificationCode,
  }) =>
      handle(
        name: 'VerifyOtp',
        () async {
          setState(
            OtpVerificationState.processing(
              email: state.email,
            ),
          );

          await _repository.verifyEmail(
            email: state.email,
            verificationCode: verificationCode,
            reason: _reason,
          );

          setState(
            OtpVerificationState.successful(
              email: state.email,
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          OtpVerificationState.idle(
            email: state.email,
            error: error,
          ),
        ),
        done: () async => setState(
          OtpVerificationState.idle(
            email: state.email,
            error: null,
          ),
        ),
      );
}

/// OtpVerficationController data class
@freezed
class OtpVerificationState with _$OtpVerificationState {
  const OtpVerificationState._();

  /// Idle state
  const factory OtpVerificationState.idle({
    required String email,
    required Object? error,
  }) = OtpVerificationState$Idle;

  /// Processing state
  const factory OtpVerificationState.processing({
    required String email,
  }) = OtpVerificationState$Processing;

  /// Successful state
  const factory OtpVerificationState.successful({
    required String email,
  }) = OtpVerificationState$Successful;

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
