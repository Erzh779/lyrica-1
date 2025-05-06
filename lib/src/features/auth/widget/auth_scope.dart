import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/features/auth/controller/auth_controller.dart';
import 'package:poem/src/features/auth/model/user.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';

/// {@template authentication_scope}
/// A widget which is responsible for providing the authentication scope.
/// {@endtemplate}
@immutable
class AuthScope extends StatefulWidget {
  /// {@macro authentication_scope}
  const AuthScope({
    required this.child,
    super.key,
  });

  /// The child widget to display
  final Widget child;

  /// Get [AuthController] from the [context]
  static AuthController of(
    final BuildContext context, [
    final bool listen = true,
  ]) =>
      context.inhOf<_InheritedAuthentication>(listen: listen).controller;

  /// Get [User] from the [context]
  static User userOf(
    final BuildContext context, {
    bool listen = false,
  }) =>
      of(context).state.user;

  /// Проверить, совпадает ли идентификатор с текущим пользователем
  static bool isSameId(
    final BuildContext context,
    final String id, {
    bool listen = false,
  }) =>
      userOf(
        context,
        listen: listen,
      ).map<bool>(
        authenticated: (_) => _.id == id,
        notAuthenticated: (_) => false,
      );

  /// Проверить, авторизован ли текущий пользователь
  static bool isAuthenticatedOf(
    final BuildContext context, {
    bool listen = false,
  }) =>
      userOf(
        context,
        listen: listen,
      ).isAuthenticated;

  /// Sign in with email and password
  static void signInWithEmailAndPasswordOf(
    final BuildContext context, {
    required String email,
    required String password,
    String? appSignature,
    void Function()? onSent,
    void Function(Object? error)? onCompleted,
  }) =>
      of(context).signInWithEmailAndPassword(
        email: email,
        password: password,
        // appSignature: appSignature,
        // onSent: onSent,
        // onCompleted: onCompleted,
      );

  /// Logout
  static void signOutOf(
    final BuildContext context, {
    void Function()? onLogout,
    void Function(Object? error)? onCompleted,
  }) =>
      of(context).signOut(
          // onLogout: onLogout,
          // onCompleted: onCompleted,
          );

  @override
  State<AuthScope> createState() => _AuthenticationScopeDelegate();
}

class _AuthenticationScopeDelegate extends State<AuthScope> {
  late AuthController _controller;

  @override
  void initState() {
    super.initState();

    _controller = context.dependencies.authController;
    _controller.addListener(_listener);
  }

  void _listener() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final state = _controller.state;

    return _InheritedAuthentication(
      controller: _controller,
      state: state,
      child: state.user.isAuthenticated
          ? AuthenticatedDependenciesScope(
              child: widget.child,
            )
          : widget.child,
    );
  }
}

@immutable
class _InheritedAuthentication extends InheritedWidget {
  final AuthState state;
  final AuthController controller;

  const _InheritedAuthentication({
    required this.state,
    required this.controller,
    required super.child,
  });

  @override
  bool updateShouldNotify(final _InheritedAuthentication oldWidget) =>
      state != oldWidget.state;
}
