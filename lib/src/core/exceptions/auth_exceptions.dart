/// {@template auth_exceptions}
/// Invalid credentials exception
/// {@endtemplate}
class InvalidCredentialsException implements Exception {
  /// {@macro auth_exceptions}
  const InvalidCredentialsException();
}

/// {@template user_not_found_exception}
/// User not found exception
/// {@endtemplate}
class UserNotFoundException implements Exception {
  /// {@macro user_not_found_exception}
  const UserNotFoundException();
}

/// {@template email_not_confirmed_exception}
/// Email not confirmed exception
/// {@endtemplate}
class EmailNotConfirmedException implements Exception {
  /// {@macro email_not_confirmed_exception}
  const EmailNotConfirmedException();
}
