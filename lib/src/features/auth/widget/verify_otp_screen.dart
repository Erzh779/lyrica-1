import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/resources/assets.gen.dart';
import 'package:poem/src/features/auth/controller/otp_verification_controller.dart';
import 'package:poem/src/features/auth/enum/verify_otp_reason.dart';
import 'package:poem/src/features/auth/widget/logo_app_bar.dart';
import 'package:poem/src/features/auth/widget/title_with_description_widget.dart';
import 'package:poem/src/features/auth/widget/verify_otp_form.dart';

/// {@template verify_otp_screen}
/// VerifyOtpScreen widget.
/// {@endtemplate}
class VerifyOtpScreen extends StatefulWidget {
  /// {@macro verify_otp_screen}
  const VerifyOtpScreen({
    required this.email,
    required this.reason,
    super.key, // ignore: unused_element
  });

  /// The email address to verify
  final String email;

  /// Reason why the user is verifying the email
  final String reason;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

/// State for widget VerifyOtpScreen.
class _VerifyOtpScreenState extends State<VerifyOtpScreen>
    with _VerifyOtpScreenStateMixin {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _controller.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, child) {
          final canPop = !isProcessing;

          return PopScope(
            canPop: canPop,
            child: child!,
          );
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              kToolbarHeight,
            ),
            child: LogoAppBar(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Assets.images.otpVerification.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 32,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleWithDescriptionWidget(
                        title: 'Код верификации',
                        description:
                            'Войдите код из письма, которую мы отправили на вашу электронную почту ${widget.email}',
                      ),
                      VerifyOtpForm(
                        controller: _controller,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

mixin _VerifyOtpScreenStateMixin on State<VerifyOtpScreen> {
  late final OtpVerificationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = OtpVerificationController(
      repository: context.dependencies.authRepository,
      reason: VerifyOtpReason.fromString(widget.reason),
      initialState: OtpVerificationState.idle(
        email: widget.email,
        error: null,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant VerifyOtpScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
