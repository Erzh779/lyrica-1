import 'package:control/control.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/auth/controller/sign_up_controller.dart';
import 'package:poem/src/features/auth/enum/verify_otp_reason.dart';
import 'package:poem/src/features/auth/utils/auth_validators.dart';

/// {@template sign_up_form}
/// A widget which is responsible for the sign up form.
/// {@endtemplate}
class SignUpForm extends StatefulWidget {
  /// {@macro sign_up_form}
  const SignUpForm({
    required this.controller,
    super.key,
  });

  /// The controller for the sign up form.
  final SignUpController controller;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> with _SignUpFormStateMixin {
  @override
  Widget build(BuildContext context) =>
      StateConsumer<SignUpController, SignUpState>(
        controller: _controller,
        listener: (context, controller, previous, current) {
          if (current.error != null) {
            ErrorUtil.showSnackBar(
              context,
              current.error!,
            );
          }

          if (current.email != null) {
            context.octopus.push(
              Routes.verifyOtp,
              arguments: {
                'email': current.email!,
                'reason': VerifyOtpReason.signUp.value,
              },
            );
          }
        },
        builder: (context, state, child) => ListenableBuilder(
          listenable: _formListenable,
          builder: (context, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              UiTextField.primary(
                enabled: !state.isProcessing,
                labelText: 'Имя пользователя',
                hintText: 'Введите имя пользователя',
                keyboardType: TextInputType.text,
                controller: _usernameController,
                errorText: _usernameError.value,
                maxLines: 1,
              ),
              UiTextField.primary(
                enabled: !state.isProcessing,
                controller: _emailController,
                labelText: 'Электронная почта',
                hintText: 'Введите электронную почту',
                keyboardType: TextInputType.emailAddress,
                errorText: _emailError.value,
                maxLines: 1,
              ),
              UiTextField.primary(
                enabled: !state.isProcessing,
                controller: _passwordController,
                labelText: 'Пароль',
                hintText: 'Введите пароль',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1,
                errorText: _passwordError.value,
              ),
              UiTextField.primary(
                enabled: !state.isProcessing,
                controller: _confirmPasswordController,
                labelText: 'Подтвердите пароль',
                hintText: 'Введите пароль',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1,
                errorText: _confirmPasswordError.value,
              ),
              UiButton.primary(
                onPressed: _signUp,
                enabled: !state.isProcessing,
                showProcessing: state.isProcessing,
                label: const Text(
                  'Зарегистрироваться',
                ),
              ),
            ],
          ),
        ),
      );
}

mixin _SignUpFormStateMixin on State<SignUpForm> {
  SignUpController get _controller => widget.controller;

  final TextEditingController _usernameController = TextEditingController(
    text: kDebugMode ? 'akoflacko' : null,
  );

  final TextEditingController _emailController = TextEditingController(
    text: kDebugMode ? 'serikqaliyev@gmail.com' : null,
  );

  final TextEditingController _passwordController = TextEditingController(
    text: kDebugMode ? 'Fpfvfn94' : null,
  );

  final TextEditingController _confirmPasswordController =
      TextEditingController(
    text: kDebugMode ? 'Fpfvfn94' : null,
  );

  final ValueNotifier<String?> _usernameError = ValueNotifier<String?>(null);

  final ValueNotifier<String?> _emailError = ValueNotifier<String?>(null);

  final ValueNotifier<String?> _passwordError = ValueNotifier<String?>(null);

  final ValueNotifier<String?> _confirmPasswordError =
      ValueNotifier<String?>(null);

  late final Listenable _formListenable;

  @override
  void initState() {
    _formListenable = Listenable.merge(
      <Listenable>[
        _usernameController,
        _emailController,
        _passwordController,
        _confirmPasswordController,
        _usernameError,
        _emailError,
        _passwordError,
        _confirmPasswordError,
      ],
    );

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _emailError.dispose();
    _passwordError.dispose();
    _usernameError.dispose();
    _confirmPasswordError.dispose();

    super.dispose();
  }

  void _signUp() {
    final username = _usernameController.text;
    final confirmPassword = _confirmPasswordController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    _emailError.value = null;
    _passwordError.value = null;
    _usernameError.value = null;
    _confirmPasswordError.value = null;

    final usernameError = AuthValidators.validateUsername(context, username);
    final emailError = AuthValidators.validateEmail(context, email);
    final passwordError = AuthValidators.validatePassword(context, password);
    final confirmPasswordError = password != confirmPassword
        ? 'Пароли не совпадают' // TODO: Localize
        : null;

    if (emailError != null ||
        passwordError != null ||
        usernameError != null ||
        confirmPasswordError != null) {
      _emailError.value = emailError;
      _passwordError.value = passwordError ?? confirmPasswordError;
      _usernameError.value = usernameError;
      _confirmPasswordError.value = confirmPasswordError;

      return;
    }

    _controller.signUpWithEmailAndPassword(
      username: username,
      email: email,
      password: password,
    );
  }
}
