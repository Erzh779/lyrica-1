import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';

enum _ButtonVariant {
  primary,
  secondary,
  text,
}

/// {@template ui_button}
/// UiButton widget to handle different button styles
/// {@endtemplate}
class UiButton extends ButtonStyleButton {
  final _ButtonVariant _variant;

  /// Destructive button
  final bool isDestructive;

  /// {@macro ui_button}
  ///
  /// Primary button
  UiButton.primary({
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    // Show a loading spinner if true
    bool showProcessing = false,
    bool enabled = true,
    Color? processingColor = Colors.white,
    IconAlignment iconAlignment = IconAlignment.end,
    Widget? label,
    Widget? icon,
    this.isDestructive = false,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  })  : _variant = _ButtonVariant.primary,
        super(
          child: _ButtonIconAndLabel(
            icon: icon,
            showProcessing: showProcessing,
            processingColor: processingColor,
            label: label,
            iconAlignment: iconAlignment,
          ),
          onPressed: enabled ? onPressed : null,
          onLongPress: enabled ? onLongPress : null,
        );

  /// {@macro ui_button}
  ///
  /// Secondary button
  UiButton.secondary({
    required VoidCallback? onPressed,
    bool enabled = true,
    bool showProcessing = false,
    Color? processingColor,
    IconAlignment iconAlignment = IconAlignment.end,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    this.isDestructive = false,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  })  : _variant = _ButtonVariant.secondary,
        super(
          child: _ButtonIconAndLabel(
            icon: icon,
            showProcessing: showProcessing,
            processingColor: processingColor,
            label: label,
            iconAlignment: iconAlignment,
          ),
          onPressed: enabled ? onPressed : null,
          onLongPress: enabled ? onLongPress : null,
        );

  /// {@macro ui_button}
  ///
  /// Text button
  UiButton.text({
    required VoidCallback? onPressed,
    bool enabled = true,
    bool showProcessing = false,
    IconAlignment iconAlignment = IconAlignment.start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    this.isDestructive = false,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  })  : _variant = _ButtonVariant.text,
        super(
          child: _ButtonIconAndLabel(
            icon: icon,
            showProcessing: showProcessing,
            processingColor: Colors.white,
            label: label,
            iconAlignment: iconAlignment,
          ),
          onPressed: enabled ? onPressed : null,
          onLongPress: enabled ? onLongPress : null,
        );

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    final colors = context.colors;
    final typography = context.typography;

    return switch (_variant) {
      _ButtonVariant.primary => _PrimaryButtonStyle(
          colors: colors, typography: typography, isDestructive: isDestructive),
      _ButtonVariant.secondary => _SecondaryButtonStyle(
          colors: colors,
          typography: typography,
          isDestructive: isDestructive,
        ),
      _ButtonVariant.text => _TextButtonStyle(
          colors: colors,
          typography: typography,
          isDestructive: isDestructive,
        ),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) => null;
}

const BorderRadius _defaultBorderRadius = BorderRadius.all(
  Radius.circular(12),
);

class _UiBaseButtonStyle extends ButtonStyle {
  final AppColors colors;
  final AppTypography typography;

  final bool isDestructive;

  const _UiBaseButtonStyle({
    required this.colors,
    required this.typography,
    this.isDestructive = false,
  });

  @override
  AlignmentGeometry? get alignment => Alignment.center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 200);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: _defaultBorderRadius,
        ),
      );

  @override
  MaterialTapTargetSize? get tapTargetSize => MaterialTapTargetSize.shrinkWrap;

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      );

  @override
  WidgetStateProperty<Size?>? get minimumSize => const WidgetStatePropertyAll(
        Size(48, 48),
      );

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.bodyMedium);

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  VisualDensity? get visualDensity => VisualDensity.adaptivePlatformDensity;

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double?>? get elevation =>
      const WidgetStatePropertyAll(0);

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith(
        (
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled))
            return SystemMouseCursors.basic;
          return SystemMouseCursors.click;
        },
      );

  @override
  WidgetStateProperty<double>? get iconSize =>
      const WidgetStatePropertyAll<double>(24.0);

  @override
  ButtonLayerBuilder? get backgroundBuilder => _backgroundBuilder;

  Widget _backgroundBuilder(
    BuildContext context,
    Set<WidgetState> states,
    Widget? child,
  ) {
    if (child == null) return const SizedBox.shrink();

    if (states.contains(WidgetState.focused)) {
      return OutlineFocusButtonBorder(
        showBorder: true,
        border: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.primary,
            width: 2,
          ),
          borderRadius: _defaultBorderRadius,
        ),
        child: child,
      );
    }

    return child;
  }

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          final color = colors.primary;

          if (states.contains(WidgetState.pressed)) {
            return color.withValues(alpha: .1);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.withValues(alpha: .08);
          }
          if (states.contains(WidgetState.focused)) {
            return color.withValues(alpha: .1);
          }

          return null;
        },
      );
}

class _PrimaryButtonStyle extends _UiBaseButtonStyle {
  const _PrimaryButtonStyle({
    required super.colors,
    required super.typography,
    required super.isDestructive,
  });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.gray300;
          }

          return isDestructive ? colors.error : colors.primary;
        },
      );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return colors.gray100;

          return colors.onPrimary;
        },
      );

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return colors.primaryPressed;
          }

          if (states.contains(WidgetState.hovered)) {
            return colors.primaryHover;
          }

          if (states.contains(WidgetState.focused)) {
            return colors.primaryHover;
          }

          return null;
        },
      );
}

class _SecondaryButtonStyle extends _UiBaseButtonStyle {
  const _SecondaryButtonStyle({
    required super.colors,
    required super.typography,
    required super.isDestructive,
  });

  @override
  WidgetStateProperty<Color?>? get backgroundColor => null;

  Color _colorByState(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return colors.gray300;
    }

    if (states.contains(WidgetState.pressed)) {
      return colors.primaryPressed;
    }

    if (states.contains(WidgetState.hovered)) {
      return colors.primaryHover;
    }

    return isDestructive ? colors.error : colors.primary;
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith(
        _colorByState,
      );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith(
        (states) {
          final color = _colorByState(states);

          return RoundedRectangleBorder(
            side: BorderSide(
              color: color,
            ),
            borderRadius: _defaultBorderRadius,
          );
        },
      );
}

class _TextButtonStyle extends _SecondaryButtonStyle {
  const _TextButtonStyle({
    required super.colors,
    required super.typography,
    required super.isDestructive,
  });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => null;
}

class _ButtonIconAndLabel extends StatelessWidget {
  const _ButtonIconAndLabel({
    required this.icon,
    required this.label,
    required this.iconAlignment,
    this.showProcessing = false,
    this.processingColor,
  });

  final Widget? icon;
  final Widget? label;

  final IconAlignment iconAlignment;

  final bool showProcessing;
  final Color? processingColor;

  @override
  Widget build(BuildContext context) {
    Widget? icon = this.icon;

    if (showProcessing) {
      final textStyle = context.typography.bodyMedium;
      final size = textStyle.fontSize ?? 24.0;

      icon = SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: processingColor ?? context.colors.primary,
        ),
      );
    }

    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: iconAlignment == IconAlignment.start
          ? [
              if (icon != null) icon,
              if (label != null) Flexible(child: label!),
            ]
          : [
              if (label != null) Flexible(child: label!),
              if (icon != null) icon,
            ],
    );
  }
}

class OutlineFocusButtonBorder extends StatelessWidget {
  const OutlineFocusButtonBorder({
    required this.child,
    required this.showBorder,
    required this.border,
    super.key,
  });

  final Widget child;
  final bool showBorder;
  final ShapeBorder border;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _OutlineFocusButtonBorderPainter(
          showBorder: showBorder,
          border: border,
        ),
        child: child,
      );
}

class _OutlineFocusButtonBorderPainter extends CustomPainter {
  _OutlineFocusButtonBorderPainter({
    required bool showBorder,
    required ShapeBorder border,
  })  : _showBorder = showBorder,
        _border = border;

  final bool _showBorder;
  final ShapeBorder _border;

  @override
  void paint(Canvas canvas, Size size) {
    if (!_showBorder) return;

    final rect = Offset.zero & size;

    _border.paint(canvas, rect);
  }

  @override
  bool shouldRepaint(_OutlineFocusButtonBorderPainter oldDelegate) =>
      _showBorder != oldDelegate._showBorder || _border != oldDelegate._border;

  @override
  bool shouldRebuildSemantics(_OutlineFocusButtonBorderPainter oldDelegate) =>
      false;
}
