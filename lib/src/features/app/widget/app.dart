import 'package:flutter/material.dart';
import 'package:poem/src/features/app/widget/material_context.dart';
import 'package:poem/src/features/dependencies/model/initialization_result.dart';
import 'package:poem/src/features/dependencies/widget/dependencies_scope.dart';

/// {@template poem_app}
/// A widget which represents the main application.
/// {@endtemplate}
class PoemApp extends StatefulWidget {
  /// {@macro poem_app}
  const PoemApp({
    required this.result,
    super.key,
  });

  /// The initialization result
  final InitializationResult result;

  /// Running this function will result in attaching
  /// corresponding [RenderObject] to the root of the tree.
  void attach([VoidCallback? callback]) {
    callback?.call();
    runApp(this);
  }

  @override
  State<PoemApp> createState() => _PoemAppState();
}

class _PoemAppState extends State<PoemApp> {
  @override
  Widget build(BuildContext context) => DependenciesScope(
        dependencies: widget.result.dependencies,
        child: MaterialContext(),
      );
}
