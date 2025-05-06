import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/resources/assets.gen.dart';
import 'package:poem/src/features/auth/controller/forgot_password_controller.dart';
import 'package:poem/src/features/auth/widget/forgot_password_form.dart';
import 'package:poem/src/features/auth/widget/logo_app_bar.dart';
import 'package:poem/src/features/auth/widget/title_with_description_widget.dart';

/// {@template forgot_password_screen}
/// ForgotPasswordScreen widget.
/// {@endtemplate}
class ForgotPasswordScreen extends StatefulWidget {
  /// {@macro forgot_password_screen}
  const ForgotPasswordScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

/// State for widget ForgotPasswordScreen.
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with _ForgotPasswordScreenStateMixin {
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
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: LogoAppBar(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Assets.images.forgotPassword.image(
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    spacing: 32,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TitleWithDescriptionWidget(
                        title: 'Забыли пароль?',
                        description:
                            'Не волнуйтесь! Это решается. Пожалуйста, введите адрес электронной почты, связанный с вашей учетной записью.',
                      ),
                      ForgotPasswordForm(
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

mixin _ForgotPasswordScreenStateMixin on State<ForgotPasswordScreen> {
  late final ForgotPasswordController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ForgotPasswordController(
      repository: context.dependencies.authRepository,
      initialState: ForgotPasswordState.idle(
        error: null,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
