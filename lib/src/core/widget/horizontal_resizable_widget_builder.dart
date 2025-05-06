import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';

/// {@template horizontal_resizable_widget}
/// HorizontalResizableWidget widget.
///
/// This widget is used to create a horizontal resizable widget.
/// {@endtemplate}
class HorizontalResizableWidget extends StatefulWidget {
  /// {@macro nav_rail}
  const HorizontalResizableWidget({
    required this.child,
    this.minWidth = 56.0,
    this.maxWidth = 200.0,
    this.initialWidth = 56.0,
    this.onResize,
    super.key,
  });

  /// Child widget.
  final Widget child;

  /// Initial width of the widget.
  /// Defaults to 56.
  final double initialWidth;

  /// Minimum width of the widget.
  /// Defaults to 56.
  final double minWidth;

  /// Maximum width of the widget.
  /// Defaults to 200.
  final double maxWidth;

  /// Callback for resize.
  final ValueChanged<double>? onResize;

  @override
  _HorizontalResizableWidgetState createState() =>
      _HorizontalResizableWidgetState();
}

class _HorizontalResizableWidgetState extends State<HorizontalResizableWidget> {
  late double _width = widget.initialWidth;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              type: MaterialType.transparency,
              child: SafeArea(
                child: SizedBox(
                  width: _width,
                  child: widget.child,
                ),
              ),
            ),
            // Область для перетаскивания
            ResizeGrip(
              onResize: (width) {
                setState(() => _width = width);
                widget.onResize?.call(width);
              },
              width: _width,
              minWidth: widget.minWidth,
              maxWidth: widget.maxWidth,
            ),
          ],
        ),
      );
}

/// {@template resize_grip}
/// ResizeGrip widget.
/// {@endtemplate}
class ResizeGrip extends StatefulWidget {
  /// {@macro resize_grip}
  const ResizeGrip({
    required this.onResize,
    required this.width,
    this.maxWidth = 300,
    this.minWidth = 48,
    super.key,
  });

  /// Callback for resize.
  final ValueChanged<double> onResize;

  /// Width of the widget.
  final double width;

  /// Max width of the widget.
  final double maxWidth;

  /// Min width of the widget.
  final double minWidth;

  @override
  State<ResizeGrip> createState() => _ResizeGripState();
}

class _ResizeGripState extends State<ResizeGrip> {
  bool _isHovered = false;

  void _toggleHover(bool isHovered) => setState(
        () => _isHovered = isHovered,
      );

  @override
  Widget build(BuildContext context) => Positioned(
        right: 0,
        top: 0,
        bottom: 0,
        child: GestureDetector(
          onHorizontalDragStart: (_) => _toggleHover(true),
          onHorizontalDragEnd: (_) => _toggleHover(false),
          onHorizontalDragUpdate: (details) {
            setState(() => _isHovered = true);

            final widgth = (widget.width + details.delta.dx).clamp(
              widget.minWidth,
              widget.maxWidth,
            );

            widget.onResize(widgth);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.resizeLeftRight,
            child: Container(
              width: _isHovered ? 8 : 1,
              color:
                  _isHovered ? context.colors.primary : context.colors.gray300,
            ),
          ),
        ),
      );
}
