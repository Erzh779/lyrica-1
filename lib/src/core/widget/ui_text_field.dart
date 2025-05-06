import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem/src/core/extension/theme.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';
import 'package:poem/src/core/widget/ui_text.dart';

enum _UiTextInputVariant {
  primary,
}

/// {@template ui_text_field}
/// UiTextField widget to simplify the creation of text fields
/// {@endtemplate}
class UiTextField extends StatefulWidget {
  /// {@macro ui_text_field}
  ///
  /// Primary text field.
  const UiTextField.primary({
    this.controller,
    this.focusNode,
    this.style,
    this.enabled,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.restorationId,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.selectionControls,
    this.maxLengthEnforcement,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.expands = false,
    this.obscureText = false,
    this.showCounter = false,
    this.hintText,
    this.errorText,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.unfocusOnTapOutside = true,
    super.key,
  }) : _variant = _UiTextInputVariant.primary;

  /// Style of the text field.
  final UiTextFieldStyle? style;

  /// Text field controller.
  final TextEditingController? controller;

  /// Focus node for the text field.
  final FocusNode? focusNode;

  /// Whether the text field is enabled.
  final bool? enabled;

  /// Input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field expands to fill the available space.
  final bool expands;

  /// Whether the text field should autofocus.
  final bool autofocus;

  /// Text capitalization for the text field.
  final TextCapitalization textCapitalization;

  /// Keyboard type for the text field.
  final TextInputType? keyboardType;

  /// Max length of the text field.
  final int? maxLength;

  /// Whether to show the character counter.
  final bool showCounter;

  /// Whether the text field is obscured (for passwords).
  final bool obscureText;

  /// Restoration ID for the text field.
  final String? restorationId;

  /// Callback when the text field is tapped.
  final VoidCallback? onTap;

  /// Callback when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Text input action for the text field.
  final TextInputAction? textInputAction;

  /// Selection controls for the text field.
  final TextSelectionControls? selectionControls;

  /// Max length enforcement for the text field.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Variant of the text field.
  final _UiTextInputVariant _variant;

  /// Hint text for the text field.
  final String? hintText;

  /// Error text for the text field.
  final String? errorText;

  /// Label text for the text field.
  final String? labelText;

  /// Minimum number of lines for the text field.
  final int? minLines;

  /// Maximum number of lines for the text field.
  final int? maxLines;

  /// Whether to unfocus the text field when tapping outside of it.
  final bool unfocusOnTapOutside;

  @override
  State<UiTextField> createState() => _UiTextFieldState();
}

class _UiTextFieldState extends State<UiTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final palette = theme.colors;
    final typography = theme.appTypography;

    final variantStyle = switch (widget._variant) {
      _UiTextInputVariant.primary => _PrimaryUiTextFieldStyle(
          palette: palette,
          typography: typography,
          hintText: widget.hintText,
          errorText: widget.errorText,
        ),
    };

    final style = variantStyle.merge(widget.style);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4,
            ),
            child: UiText.bodyLarge(
              widget.labelText!,
            ),
          ),
        TextField(
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          restorationId: widget.restorationId,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          expands: widget.expands,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          controller: widget.controller,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          textInputAction: widget.textInputAction,
          selectionControls: widget.selectionControls,
          cursorColor: style.cursorColor,
          style: style.textStyle,
          decoration: style,
          cursorWidth: style.cursorWidth,
          cursorHeight: style.cursorHeight,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onTapOutside: (_) {
            if (!widget.unfocusOnTapOutside) return;

            if (widget.focusNode != null) return widget.focusNode?.unfocus();

            FocusManager.instance.primaryFocus?.unfocus();
          },
          buildCounter: (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) {
            if (!widget.showCounter || maxLength == null) return null;

            return Text(
              '$currentLength/$maxLength',
              style: style.counterStyle,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ],
    );
  }
}

class _PrimaryUiTextFieldStyle extends UiTextFieldStyle {
  const _PrimaryUiTextFieldStyle({
    required this.palette,
    required this.typography,
    super.hintText,
    super.errorText,
  }) : borderRadius = const BorderRadius.all(
          Radius.circular(
            16,
          ),
        );

  final AppColors palette;
  final AppTypography typography;

  @override
  Color? get fillColor => WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return palette.gray100;
          return palette.surface;
        },
      );

  @override
  TextStyle? get textStyle => WidgetStateTextStyle.resolveWith(
        (states) {
          Color color = palette.onBackground;
          if (states.contains(WidgetState.disabled)) color = palette.gray300;
          return typography.bodyLarge.copyWith(color: color);
        },
      );

  @override
  TextStyle? get hintStyle => WidgetStateTextStyle.resolveWith(
        (states) {
          Color color = palette.gray500;
          if (states.contains(WidgetState.disabled)) color = palette.gray300;
          return typography.bodyLarge.copyWith(color: color);
        },
      );

  @override
  Color? get iconColor => WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return palette.gray300;
          if (states.contains(WidgetState.error)) return palette.error;
          return palette.primary;
        },
      );

  @override
  TextStyle? get counterStyle => typography.bodySmall.copyWith(
        color: palette.gray500,
      );

  @override
  TextStyle? get errorStyle => typography.bodySmall.copyWith(
        color: palette.error,
      );

  final BorderRadius borderRadius;

  InputBorder _buildInputBorder([
    Color? color,
  ]) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: color != null
            ? BorderSide(
                color: color,
              )
            : BorderSide.none,
      );

  @override
  InputBorder? get focusedBorder => _buildInputBorder(
        palette.primary,
      );

  @override
  InputBorder? get focusedErrorBorder => _buildInputBorder(
        palette.error,
      );

  @override
  InputBorder? get errorBorder => _buildInputBorder(
        palette.error,
      );

  @override
  InputBorder? get enabledBorder => _buildInputBorder(
        palette.outline,
      );

  @override
  InputBorder? get disabledBorder => _buildInputBorder(
        palette.gray100,
      );

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      );

  @override
  BoxConstraints? get constraints => const BoxConstraints(
        minHeight: 32,
      );

  @override
  Color? get cursorColor => WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) return palette.error;
          return palette.primary;
        },
      );

  @override
  bool? get isDense => true;
}

/// {@template ui_text_field_style}
/// UiTextFieldStyle decoration for the text field.
/// It extends the [InputDecoration] class and adds some extra properties
/// {@endtemplate}
class UiTextFieldStyle extends InputDecoration {
  /// {@macro ui_text_field_style}
  const UiTextFieldStyle({
    super.icon,
    super.iconColor,
    super.label,
    super.labelText,
    super.labelStyle,
    super.floatingLabelStyle,
    super.helper,
    super.helperText,
    super.helperStyle,
    super.helperMaxLines,
    super.hintText,
    super.hintStyle,
    super.hintTextDirection,
    super.hintMaxLines,
    super.hintFadeDuration,
    super.error,
    super.errorText,
    super.errorStyle,
    super.errorMaxLines,
    super.floatingLabelBehavior,
    super.floatingLabelAlignment,
    super.isCollapsed,
    super.isDense,
    super.contentPadding,
    super.prefixIcon,
    super.prefixIconConstraints,
    super.prefix,
    super.prefixText,
    super.prefixStyle,
    super.prefixIconColor,
    super.suffixIcon,
    super.suffix,
    super.suffixText,
    super.suffixStyle,
    super.suffixIconColor,
    super.suffixIconConstraints,
    super.counter,
    super.counterText,
    super.counterStyle,
    super.filled,
    super.fillColor,
    super.focusColor,
    super.hoverColor,
    super.errorBorder,
    super.focusedBorder,
    super.focusedErrorBorder,
    super.disabledBorder,
    super.enabledBorder,
    super.border,
    super.enabled = true,
    super.semanticCounterText,
    super.alignLabelWithHint,
    super.constraints,
    this.textStyle,
    this.cursorColor,
    this.cursorWidth = 1,
    this.cursorHeight,
  });

  /// The style to use for the text being edited.
  final TextStyle? textStyle;

  /// The color to use for the cursor.
  final Color? cursorColor;

  /// The width of the cursor.
  final double cursorWidth;

  /// The height of the cursor.
  final double? cursorHeight;

  /// Merge two [UiTextFieldStyle] objects.
  ///
  /// If a property is not null in [other], it will be used,
  /// otherwise the property from `this` will be used.
  UiTextFieldStyle merge(UiTextFieldStyle? other) {
    if (other == null) return this;

    return UiTextFieldStyle(
      icon: other.icon ?? icon,
      iconColor: other.iconColor ?? iconColor,
      label: other.label ?? label,
      labelText: other.labelText ?? labelText,
      labelStyle: other.labelStyle ?? labelStyle,
      floatingLabelStyle: other.floatingLabelStyle ?? floatingLabelStyle,
      helper: other.helper ?? helper,
      helperText: other.helperText ?? helperText,
      helperStyle: other.helperStyle ?? helperStyle,
      helperMaxLines: other.helperMaxLines ?? helperMaxLines,
      hintText: other.hintText ?? hintText,
      hintStyle: other.hintStyle ?? hintStyle,
      hintTextDirection: other.hintTextDirection ?? hintTextDirection,
      hintMaxLines: other.hintMaxLines ?? hintMaxLines,
      hintFadeDuration: other.hintFadeDuration ?? hintFadeDuration,
      error: other.error ?? error,
      errorText: other.errorText ?? errorText,
      errorStyle: other.errorStyle ?? errorStyle,
      errorMaxLines: other.errorMaxLines ?? errorMaxLines,
      floatingLabelBehavior:
          other.floatingLabelBehavior ?? floatingLabelBehavior,
      floatingLabelAlignment:
          other.floatingLabelAlignment ?? floatingLabelAlignment,
      isCollapsed: other.isCollapsed ?? isCollapsed,
      isDense: other.isDense ?? isDense,
      contentPadding: other.contentPadding ?? contentPadding,
      prefixIcon: other.prefixIcon ?? prefixIcon,
      prefixIconConstraints:
          other.prefixIconConstraints ?? prefixIconConstraints,
      prefix: other.prefix ?? prefix,
      prefixText: other.prefixText ?? prefixText,
      prefixStyle: other.prefixStyle ?? prefixStyle,
      prefixIconColor: other.prefixIconColor ?? prefixIconColor,
      suffixIcon: other.suffixIcon ?? suffixIcon,
      suffix: other.suffix ?? suffix,
      suffixText: other.suffixText ?? suffixText,
      suffixStyle: other.suffixStyle ?? suffixStyle,
      suffixIconColor: other.suffixIconColor ?? suffixIconColor,
      suffixIconConstraints:
          other.suffixIconConstraints ?? suffixIconConstraints,
      counter: other.counter ?? counter,
      counterText: other.counterText ?? counterText,
      counterStyle: other.counterStyle ?? counterStyle,
      filled: other.filled ?? filled,
      fillColor: other.fillColor ?? fillColor,
      focusColor: other.focusColor ?? focusColor,
      hoverColor: other.hoverColor ?? hoverColor,
      errorBorder: other.errorBorder ?? errorBorder,
      focusedBorder: other.focusedBorder ?? focusedBorder,
      focusedErrorBorder: other.focusedErrorBorder ?? focusedErrorBorder,
      disabledBorder: other.disabledBorder ?? disabledBorder,
      enabledBorder: other.enabledBorder ?? enabledBorder,
      border: other.border ?? border,
      enabled: other.enabled,
      semanticCounterText: other.semanticCounterText ?? semanticCounterText,
      alignLabelWithHint: other.alignLabelWithHint ?? alignLabelWithHint,
      constraints: other.constraints ?? constraints,
      textStyle: other.textStyle ?? textStyle,
      cursorColor: other.cursorColor ?? cursorColor,
      cursorWidth: cursorWidth,
      cursorHeight: other.cursorHeight ?? cursorHeight,
    );
  }
}
