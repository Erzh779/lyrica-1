import 'package:poem/src/features/auth/model/user.dart';

/// {@template auth_network_datasource}
/// An interface for auth network datasource.
/// {@endtemplate}
abstract interface class IAuthNetworkDatasource {
  /// Sign in with email and password.
  Future<User$Authenticated> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Stream of user changes.
  Stream<User> userChanges();
}
