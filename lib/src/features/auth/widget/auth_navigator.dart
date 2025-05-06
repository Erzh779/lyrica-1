import 'package:flutter/material.dart';
import 'package:poem/src/features/auth/widget/sign_in_screen.dart';
import 'package:poem/src/features/auth/widget/sign_up_screen.dart';

/// {@template auth_navigator}
/// A widget which is responsible for the auth navigator.
/// {@endtemplate}
class AuthNavigator extends StatefulWidget {
  /// {@macro auth_navigator}
  const AuthNavigator({
    super.key,
  });

  /// Get the [AuthNavigatorState] from the [context].
  static AuthNavigatorState of(BuildContext context) {
    final navigator = context.findAncestorStateOfType<AuthNavigatorState>();
    if (navigator == null) throw Exception('AuthNavigator not found');
    return navigator;
  }

  @override
  State<AuthNavigator> createState() => AuthNavigatorState();
}

/// {@template auth_navigator_state}
/// A state which is responsible for the auth navigator state.
/// {@endtemplate}
class AuthNavigatorState extends State<AuthNavigator> {
  /// List of pages
  List<Page<Object?>> pages = [];

  @override
  void initState() {
    pages = [
      MaterialPage<Object>(
        name: 'sign-in',
        child: SignInScreen(),
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Push the sign up page
  void signUp() => setState(
        () {
          final pages = [...this.pages];

          // check if the last page is not the sign up page
          if (pages.last.name == 'sign-up') return;

          // check if the pages contain the sign up page
          final index = pages.indexWhere((page) => page.name == 'sign-up');

          if (index != -1) {
            // move the sign up page to the last
            final page = pages.removeAt(index);
            pages.add(page);
          }

          // add the sign up page
          pages.add(
            MaterialPage<Object>(
              name: 'sign-up',
              child: SignUpScreen(),
            ),
          );

          setState(
            () => this.pages = pages,
          );
        },
      );

  /// Pop the sign up page
  void signIn() => setState(
        () => pages = [
          MaterialPage<Object>(
            name: 'sign-in',
            child: SignInScreen(),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => Navigator(
        pages: pages,
        onDidRemovePage: (page) => pages.remove(
          page,
        ),
      );
}
