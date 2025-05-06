import 'package:flutter/widgets.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/features/auth/controller/otp_verification_controller.dart';
import 'package:poem/src/features/auth/widget/focusable_text_button.dart';
import 'package:poem/src/features/auth/widget/otp_field.dart';

/// {@template verify_otp_form}
/// VerifyOtpForm widget.
/// {@endtemplate}
class VerifyOtpForm extends StatefulWidget {
  /// {@macro verify_otp_form}
  const VerifyOtpForm({
    required this.controller,
    super.key, // ignore: unused_element
  });

  /// The controller for the OTP verification form.
  final OtpVerificationController controller;

  @override
  State<VerifyOtpForm> createState() => _VerifyOtpFormState();
}

/// State for widget VerifyOtpForm.
class _VerifyOtpFormState extends State<VerifyOtpForm>
    with _VerifyOtpFormStateMixin {
  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: _formListenable,
        builder: (context, child) {
          final isProcessing = _verificationController.state.isProcessing;

          return Column(
            spacing: 32,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  OtpField(
                    controller: _controller,
                    enabled: !isProcessing,
                    errorText: _errorText.value,
                    onComplete: _onVerifyOtp,
                  ),
                  UiButton.primary(
                    onPressed: isProcessing ? null : _onVerifyOtp,
                    label: Text(
                      'Подтвердить',
                    ),
                    enabled: !isProcessing,
                    showProcessing: isProcessing,
                  ),
                ],
              ),
              FocusableTextButton(
                enabled: !isProcessing,
                onPressed: () {},
                labelText: 'Не получили код? ',
                buttonText: 'Отправить повторно',
              ),
            ],
          );
        },
      );
}

mixin _VerifyOtpFormStateMixin on State<VerifyOtpForm> {
  OtpVerificationController get _verificationController => widget.controller;

  final TextEditingController _controller = TextEditingController();

  final ValueNotifier<String?> _errorText = ValueNotifier<String?>(null);

  late final Listenable _formListenable;

  @override
  void initState() {
    final isProcessingNotifier = _verificationController.select(
      (state) => state.isProcessing,
    );

    final errorTextNotifier = _verificationController.select(
      (state) => state.error,
    );

    _formListenable = Listenable.merge(
      <Listenable>[
        _controller,
        _errorText,
        isProcessingNotifier,
        errorTextNotifier,
      ],
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _errorText.dispose();

    super.dispose();
  }

  void _onVerifyOtp() {
    final otp = _controller.text.trim();

    _errorText.value = null;

    if (otp.isEmpty) {
      _errorText.value = 'Введите код';
      return;
    }

    if (otp.length != 6) {
      _errorText.value = 'Код должен содержать 6 цифр';
      return;
    }

    _verificationController.verifyOtp(
      verificationCode: otp,
    );
  }
}
