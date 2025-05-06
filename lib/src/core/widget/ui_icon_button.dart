import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/resources/app_colors.dart';
import 'package:poem/src/core/resources/app_typography.dart';
import 'package:poem/src/core/widget/ui_button.dart';

/// {@template ui_icon_button}
/// UiIconButton widget to simplify the creation of icon buttons
/// {@endtemplate}
class UiIconButton extends ButtonStyleButton {
  /// {@macro ui_button}
  UiIconButton({
    required VoidCallback? onPressed,
    required this.icon,
    VoidCallback? onLongPress,
    this.enabled = true,
    this.iconSize = 24.0,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    this.isDestructive = false,
  }) : super(
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
          onPressed: enabled ? onPressed : null,
          onLongPress: enabled ? onLongPress : null,
        );

  /// Icon size
  final double iconSize;

  /// Icon widget
  final Widget icon;

  /// Whether the button is enabled or not
  final bool enabled;

  /// Whether the button is destructive or not
  /// Defaults to false.
  final bool isDestructive;

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) =>
      _IconButtonStyle(
        colorPalette: context.colors,
        typography: context.typography,
        isDestructive: isDestructive,
      );

  @override
  ButtonStyle? themeStyleOf(BuildContext context) => null;
}

class _IconButtonStyle extends ButtonStyle {
  final AppColors colorPalette;
  final AppTypography typography;

  final bool isDestructive;

  const _IconButtonStyle({
    required this.colorPalette,
    required this.typography,
    this.isDestructive = false,
  });

  static const BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(12),
  );

  @override
  AlignmentGeometry? get alignment => Alignment.center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 200);

  Color _colorByState(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return colorPalette.gray300;
    }

    if (states.contains(WidgetState.pressed)) {
      return colorPalette.primaryPressed;
    }

    if (states.contains(WidgetState.hovered)) {
      return colorPalette.primaryHover;
    }

    return isDestructive ? colorPalette.error : colorPalette.outline;
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colorPalette.gray300;
          }

          if (states.contains(WidgetState.pressed)) {
            return colorPalette.primaryPressed;
          }

          if (states.contains(WidgetState.hovered)) {
            return colorPalette.primaryHover;
          }

          return isDestructive ? colorPalette.error : colorPalette.primary;
        },
      );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          side: BorderSide(
            color: _colorByState(states),
          ),
          borderRadius: _borderRadius,
        ),
      );

  @override
  MaterialTapTargetSize? get tapTargetSize => MaterialTapTargetSize.padded;

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(
        EdgeInsets.zero,
      );

  @override
  WidgetStateProperty<Size?>? get minimumSize => const WidgetStatePropertyAll(
        Size(48, 48),
      );

  @override
  WidgetStateProperty<Size?>? get maximumSize => const WidgetStatePropertyAll(
        Size(48, 48),
      );

  @override
  WidgetStateProperty<Size?>? get fixedSize => const WidgetStatePropertyAll(
        Size(48, 48),
      );

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
            color: colorPalette.accent,
            width: 2,
          ),
          borderRadius: _borderRadius,
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
          final color = colorPalette.primary;

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
