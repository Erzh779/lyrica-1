import 'package:poem/src/features/auth/enum/verify_otp_reason.dart';
import 'package:poem/src/features/auth/model/user.dart';

/// {@template auth_repository}
/// An interface for auth repository.
/// {@endtemplate}
abstract interface class IAuthRepository {
  /// Restore user.
  Future<User> restore();

  /// Sign in with email and password.
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up with email and password.
  Future<User> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  });

  /// Verify email.
  Future<void> verifyEmail({
    required String email,
    required String verificationCode,
    required VerifyOtpReason reason,
  });

  /// Sign out.
  Future<void> signOut();

  /// Stream of user changes.
  Stream<User> userChanges();

  /// Reset password for email.
  Future<void> resetPasswordForEmail({
    required String email,
  });
}
