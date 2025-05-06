import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/router/guards/auth_guard.dart';
import 'package:poem/src/core/router/routes.dart';

/// {@template router_state_mixin}
/// A mixin that provides a router instance and error observer.
/// {@endtemplate}
mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  /// The router instance.
  late final Octopus router;

  /// The error observer.
  late final ValueNotifier<List<({Object error, StackTrace stackTrace})>>
      errorsObserver;

  @override
  void initState() {
    // Observe all errors.
    errorsObserver =
        ValueNotifier<List<({Object error, StackTrace stackTrace})>>(
      <({Object error, StackTrace stackTrace})>[],
    );

    final authController = context.dependencies.authController;

    // Create router.
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.home,
      restorationScopeId: 'poem_app',
      guards: <IOctopusGuard>[
        AuthGuard(
          getUser: () => authController.state.user,
          routes: {
            Routes.onboarding.name,
            Routes.signIn.name,
            Routes.signUp.name,
            Routes.verifyOtp.name,
            Routes.forgotPassword.name,
          },
          signInNavigation: OctopusState.single(
            Routes.onboarding.node(),
          ),
          homeNavigation: OctopusState.single(
            Routes.home.node(),
          ),
          refresh: authController,
        ),
        // CreateEventGuard(),
      ],
      onError: (error, stackTrace) =>
          errorsObserver.value = <({Object error, StackTrace stackTrace})>[
        (error: error, stackTrace: stackTrace),
        ...errorsObserver.value,
      ],
      observers: [
        // Log all navigation events.
        // OctopusLogger(),
      ],
    );
    super.initState();
  }
}
