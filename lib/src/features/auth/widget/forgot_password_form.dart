import 'package:control/control.dart';
import 'package:flutter/widgets.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/auth/controller/forgot_password_controller.dart';
import 'package:poem/src/features/auth/utils/auth_validators.dart';

/// {@template forgot_password_form}
/// ForgotPasswordForm widget.
/// {@endtemplate}
class ForgotPasswordForm extends StatefulWidget {
  /// {@macro forgot_password_form}
  const ForgotPasswordForm({
    required this.controller,
    super.key, // ignore: unused_element
  });

  /// The controller for the form
  final ForgotPasswordController controller;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

/// State for widget ForgotPasswordForm.
class _ForgotPasswordFormState extends State<ForgotPasswordForm>
    with _ForgotPasswordFormStateMixin {
  @override
  Widget build(BuildContext context) =>
      StateConsumer<ForgotPasswordController, ForgotPasswordState>(
        controller: widget.controller,
        listener: (context, controller, previous, current) {
          if (current.error != null) {
            ErrorUtil.showSnackBar(
              context,
              current.error!,
            );
          }
        },
        builder: (context, state, child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            ValueListenableBuilder(
              valueListenable: _emailError,
              builder: (context, emailError, _) => UiTextField.primary(
                enabled: !state.isProcessing,
                controller: _emailController,
                errorText: emailError,
                labelText: 'Электронная почта',
                hintText: 'Введите электронную почту',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            UiButton.primary(
              enabled: !state.isProcessing,
              showProcessing: state.isProcessing,
              onPressed: _onSendEmail,
              label: const Text(
                'Отправить код',
              ),
            ),
          ],
        ),
      );
}

mixin _ForgotPasswordFormStateMixin on State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<String?> _emailError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailError.dispose();

    super.dispose();
  }

  void _onSendEmail() {
    final email = _emailController.text.trim();

    _emailError.value = null;

    final error = AuthValidators.validateEmail(context, email);
    if (error != null) {
      _emailError.value = error;
      return;
    }

    widget.controller.resetPasswordForEmail(
      email: email,
    );
  }
}
