import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/features/auth/widget/forgot_password_screen.dart';
import 'package:poem/src/features/auth/widget/onboarding_screen.dart';
import 'package:poem/src/features/auth/widget/sign_in_screen.dart';
import 'package:poem/src/features/auth/widget/sign_up_screen.dart';
import 'package:poem/src/features/auth/widget/verify_otp_screen.dart';
import 'package:poem/src/features/home/widget/home_screen.dart';
import 'package:poem/src/features/poems/widget/create_poem_screen.dart';

/// {@template routes}
/// Routes for the application
/// {@endtemplate}
enum Routes with OctopusRoute {
  /// Auth route
  onboarding('onboarding', title: 'Onboarding'),

  /// Sign in route
  signIn('sign-in', title: 'Sign In'),

  /// Sign up route
  signUp('sign-up', title: 'Sign Up'),

  /// Verify otp route
  verifyOtp('verify-otp', title: 'Verify Otp'),

  /// Forgot password route
  forgotPassword('forgot-password', title: 'Forgot Password'),

  /// Home route
  home('home', title: 'Home'),

  /// Create test
  createPoem('create-poem', title: 'Create Poem'),
  ;

  @override
  final String name;

  @override
  final String title;

  const Routes(
    this.name, {
    required this.title,
  });

  @override
  Widget builder(
    BuildContext context,
    OctopusState state,
    OctopusNode node,
  ) =>
      switch (this) {
        Routes.onboarding => const OnboardingScreen(),
        Routes.signIn => const SignInScreen(),
        Routes.signUp => const SignUpScreen(),
        Routes.verifyOtp => VerifyOtpScreen(
            email: node.arguments['email'] as String,
            reason: node.arguments['reason'] as String,
          ),
        Routes.forgotPassword => const ForgotPasswordScreen(),
        Routes.home => const HomeScreen(),
        Routes.createPoem => const CreatePoemScreen(),
      };
}
