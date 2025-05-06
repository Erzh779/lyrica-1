import 'package:control/control.dart';
import 'package:flutter/widgets.dart';

/// {@template state_controller_processing_builder}
/// StateControllerProcessingBuilder widget.
/// {@endtemplate}
class StateControllerProcessingBuilder<S extends Object>
    extends StatelessWidget {
  /// {@macro state_controller_processing_builder}
  const StateControllerProcessingBuilder({
    required this.stateController,
    required this.builder,
    this.isProcessing,
    super.key,
  });

  /// State controller to listen to.
  final StateController<S> stateController;

  /// Builder for the processing state.
  final bool Function(S state)? isProcessing;

  /// Builder for the child widget.
  final Widget Function(BuildContext context, bool isProcessing) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: stateController.select(
          (state) => isProcessing?.call(state) ?? false,
        ),
        builder: (context, isProcessing, child) => builder.call(
          context,
          isProcessing,
        ),
      );
}
