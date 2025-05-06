import 'package:control/control.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/auth/controller/auth_controller.dart';
import 'package:poem/src/features/auth/utils/auth_validators.dart';
import 'package:poem/src/features/auth/widget/auth_scope.dart';
import 'package:poem/src/features/auth/widget/focusable_text_button.dart';

/// {@template sign_in_form}
/// A widget which represents the sign in form.
/// {@endtemplate}
class SignInForm extends StatefulWidget {
  /// {@macro sign_in_form}
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> with _SignInFormStateMixin {
  @override
  Widget build(BuildContext context) =>
      StateConsumer<AuthController, AuthState>(
        controller: AuthScope.of(context, false),
        listener: (context, controller, previous, current) {
          if (current.hasError) {
            ErrorUtil.showSnackBar(
              context,
              current.error!,
            );
          }
        },
        builder: (context, state, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            ValueListenableBuilder(
              valueListenable: _emailError,
              builder: (context, emailError, _) => UiTextField.primary(
                enabled: !state.isProcessing,
                controller: _emailController,
                labelText: 'Электронная почта',
                hintText: 'Введите электронную почту',
                errorText: emailError,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _passwordError,
              builder: (context, passwordError, _) => ValueListenableBuilder(
                valueListenable: _isPasswordVisible,
                builder: (context, isPasswordVisible, _) => UiTextField.primary(
                  enabled: !state.isProcessing,
                  controller: _passwordController,
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                  errorText: passwordError,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !isPasswordVisible,
                  maxLines: 1,
                  style: UiTextFieldStyle(
                    suffixIcon: IconButton(
                      onPressed:
                          state.isProcessing ? null : _togglePasswordVisibility,
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FocusableTextButton(
                enabled: !state.isProcessing,
                onPressed: () {
                  context.octopus.push(
                    Routes.forgotPassword,
                  );
                },
                buttonText: 'Забыли пароль?',
                buttonTextColor: context.colors.gray500,
              ),
            ),
            UiButton.primary(
              onPressed: state.isProcessing ? null : _signIn,
              enabled: !state.isProcessing,
              showProcessing: state.isProcessing,
              label: const Text(
                'Войти',
              ),
            ),
          ],
        ),
      );
}

mixin _SignInFormStateMixin on State<SignInForm> {
  late final AuthController _controller;

  final TextEditingController _emailController = TextEditingController(
    text: kDebugMode ? 'serikqaliyev@gmail.com' : null,
  );

  final TextEditingController _passwordController = TextEditingController(
    text: kDebugMode ? 'Fpfvfn94' : null,
  );

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  final ValueNotifier<String?> _emailError = ValueNotifier<String?>(null);

  final ValueNotifier<String?> _passwordError = ValueNotifier<String?>(null);

  void _togglePasswordVisibility() =>
      _isPasswordVisible.value = !_isPasswordVisible.value;

  @override
  void initState() {
    _controller = AuthScope.of(context, false);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _isPasswordVisible.dispose();

    _emailError.dispose();
    _passwordError.dispose();

    super.dispose();
  }

  void _signIn() {
    final email = _emailController.text;
    final password = _passwordController.text;

    _emailError.value = null;
    _passwordError.value = null;

    final emailError = AuthValidators.validateEmail(context, email);
    final passwordError = AuthValidators.validatePassword(context, password);

    if (emailError != null || passwordError != null) {
      _emailError.value = emailError;
      _passwordError.value = passwordError;

      return;
    }

    if (email.isEmpty || password.isEmpty) return;

    _controller.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
