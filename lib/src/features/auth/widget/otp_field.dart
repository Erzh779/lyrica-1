import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:poem/src/core/extension/theme.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template otp_field}
/// OtpField widget.
/// {@endtemplate}
class OtpField extends StatelessWidget {
  /// {@macro otp_field}
  const OtpField({
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.onComplete,
    super.key, // ignore: unused_element
  });

  /// The controller for the OTP field
  final TextEditingController controller;

  /// The error text to display
  final String? errorText;

  /// Whether the field is enabled or not
  final bool enabled;

  /// Callback when the OTP is completed
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colors = theme.colors;
    final typography = theme.appTypography;

    final defaultPinTheme = PinTheme(
      constraints: const BoxConstraints(
        minHeight: 56,
        minWidth: 48,
      ),
      textStyle: typography.bodyLarge.copyWith(
        color: colors.onBackground,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.outline,
        ),
      ),
    );

    return Pinput(
      length: 6,
      enabled: enabled,
      controller: controller,
      errorText: errorText,
      onCompleted: (_) => onComplete?.call(),
      forceErrorState: errorText != null,
      errorBuilder: (errorText, pin) {
        if (errorText == null) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiText.bodyLarge(
                errorText,
                color: colors.error,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      separatorBuilder: (index) => const SizedBox(
        width: 8,
      ),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(
          color: colors.primary,
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(
          color: colors.error,
        ),
      ),
      disabledPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: colors.gray100,
          border: Border.all(
            color: colors.gray100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: typography.bodyLarge.copyWith(
          color: colors.gray300,
        ),
      ),
    );
  }
}
