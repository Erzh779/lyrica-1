import 'dart:async';

import 'package:poem/src/core/exceptions/auth_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:poem/src/features/auth/data/auth_repository.dart';
import 'package:poem/src/features/auth/enum/verify_otp_reason.dart';
import 'package:poem/src/features/auth/model/user.dart';

/// {@template auth_repository_supabase}
/// A supabase auth repository.
/// {@endtemplate}
class AuthRepository$Supabase implements IAuthRepository {
  /// {@macro auth_repository_supabase}
  AuthRepository$Supabase();

  supabase.GoTrueClient get _authClient =>
      supabase.Supabase.instance.client.auth;

  @override
  Future<User> restore() async {
    try {
      final session = _authClient.currentSession;
      final user = session?.user;

      if (user != null) {
        return User.fromSupabase(user);
      } else {
        return User.notAuthenticated();
      }
    } on Object {
      rethrow;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authClient.signInWithPassword(
        email: email,
        password: password,
      );

      return User.fromSupabase(response.user);
    } on supabase.AuthApiException catch (error, stackTrace) {
      if (error.code == 'invalid_credentials') {
        Error.throwWithStackTrace(
          InvalidCredentialsException(),
          stackTrace,
        );
      }
      
      
      rethrow;
    } on Object {
      rethrow;
    }
  }

  @override
  Future<void> signOut() => _authClient.signOut();

  @override
  Future<User> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authClient.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        },
      );

      final user = response.user;

      return User.fromSupabase(user);
    } on Object {
      rethrow;
    }
  }

  @override
  Stream<User> userChanges() => _authClient.onAuthStateChange.map(
        (event) => User.fromSupabase(
          event.session?.user,
        ),
      );

  @override
  Future<void> verifyEmail({
    required String email,
    required String verificationCode,
    required VerifyOtpReason reason,
  }) async {
    try {
      await _authClient.verifyOTP(
        email: email,
        type: reason.toOtpType(),
        token: verificationCode,
      );
    } on Object {
      rethrow;
    }
  }

  @override
  Future<void> resetPasswordForEmail({
    required String email,
  }) =>
      _authClient.resetPasswordForEmail(
        email,
      );
}
