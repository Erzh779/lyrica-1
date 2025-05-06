import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

/// {@template cohorts_screen}
/// CohortsScreen widget.
/// {@endtemplate}
class CohortsScreen extends StatefulWidget {
  /// {@macro cohorts_screen}
  const CohortsScreen({
    super.key, // ignore: unused_element
  });

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _CohortsScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_CohortsScreenState>();

  @override
  State<CohortsScreen> createState() => _CohortsScreenState();
}

/// State for widget CohortsScreen.
class _CohortsScreenState extends State<CohortsScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant CohortsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => const Placeholder();
}
