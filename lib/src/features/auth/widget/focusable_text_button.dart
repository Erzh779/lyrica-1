import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template focusable_text_button}
/// Виджет с текстом и кликабельной кнопкой, поддерживающей фокус.
/// {@endtemplate}
class FocusableTextButton extends StatefulWidget {
  /// {@macro focusable_text_button}
  const FocusableTextButton({
    required VoidCallback onPressed,
    required this.buttonText,
    this.buttonTextColor,
    this.labelText,
    this.enabled = true,
    super.key,
  }) : onPressed = enabled ? onPressed : null;

  /// Label text on the left side of the button
  final String? labelText;

  /// Text of the button
  final String buttonText;

  /// Color of the button text
  final Color? buttonTextColor;

  /// Callback function to be called when the button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is enabled or not
  final bool enabled;

  @override
  State<FocusableTextButton> createState() => _FocusableTextButtonState();
}

class _FocusableTextButtonState extends State<FocusableTextButton> {
  Color? _buttonTextColor;
  Color _buttonBackgroundColor = Colors.transparent;

  @override
  void initState() {
    _buttonTextColor = widget.buttonTextColor;

    super.initState();
  }

  void _handleFocusHighlight(bool isHovered) => setState(
        () {
          _buttonTextColor = isHovered
              ? context.colors.onPrimary
              : widget.buttonTextColor ?? context.colors.primary;
          _buttonBackgroundColor =
              isHovered ? context.colors.primary : Colors.transparent;
        },
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (widget.labelText != null)
          UiText.bodyLarge(
            widget.labelText!,
            color: colors.gray500,
          ),
        FocusableActionDetector(
          enabled: widget.enabled,
          mouseCursor: widget.enabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onShowFocusHighlight: _handleFocusHighlight,
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
          },
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: (intent) => widget.onPressed?.call(),
            ),
          },
          child: GestureDetector(
            onTap: widget.enabled ? widget.onPressed : null,
            child: ColoredBox(
              color:
                  widget.enabled ? _buttonBackgroundColor : Colors.transparent,
              child: UiText.bodyLarge(
                widget.buttonText,
                color: widget.enabled
                    ? (_buttonTextColor ?? colors.primary)
                    : colors.gray500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
