// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'user.freezed.dart';
part 'user.g.dart';

/// User data class
@freezed
class User with _$User {
  const User._();

  /// Authenticated user
  const factory User.authenticated({
    required String id,
    required bool emailVerified,
    String? email,
  }) = User$Authenticated;

  /// Not authenticated user
  const factory User.notAuthenticated() = User$NotAuthenticated;

  /// Generate User class from [Map<String, Object?>]
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  /// Map [supabase.User] to [User]
  factory User.fromSupabase(supabase.User? user) => user != null
      ? User.authenticated(
          id: user.id,
          email: user.email,
          emailVerified: user.emailConfirmedAt != null,
        )
      : User.notAuthenticated();

  /// Check if user is authenticated
  bool get isAuthenticated => maybeMap(
        authenticated: (user) => user.emailVerified,
        orElse: () => false,
      );

  /// Get user id
  String? get id => maybeMap(
        authenticated: (user) => user.id,
        orElse: () => null,
      );

  /// Get user email
  String? get email => maybeMap(
        authenticated: (user) => user.email,
        orElse: () => null,
      );

  /// Get user email confirmed status
  bool get isEmailVerified => maybeMap(
        authenticated: (user) => user.emailVerified,
        orElse: () => false,
      );
}
