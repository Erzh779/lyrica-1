import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template verify_otp_reason}
/// Reason why the user is verifying the email
/// {@endtemplate}
enum VerifyOtpReason {
  /// User is verifying email for sign up
  signUp('sign_up'),

  /// User is verifying email for sign in
  resetPassword('reset_password'),
  ;

  /// String representation of the enum value
  final String value;

  const VerifyOtpReason(this.value);

  /// Returns the enum value from the string
  static VerifyOtpReason fromString(
    String value, {
    VerifyOtpReason? fallback,
  }) =>
      VerifyOtpReason.values.firstWhere(
        (e) => e.value == value,
        orElse: () => fallback ?? VerifyOtpReason.signUp,
      );
}

/// Extension for [VerifyOtpReason].
extension VerifyOtpReasonX on VerifyOtpReason {
  /// Returns the enum value from the string
  OtpType toOtpType() => switch (this) {
        VerifyOtpReason.signUp => OtpType.signup,
        VerifyOtpReason.resetPassword => OtpType.recovery,
      };
}
