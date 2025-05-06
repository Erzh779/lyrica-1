import 'package:flutter/widgets.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/features/dependencies/model/authenticated_dependencies.dart';
import 'package:poem/src/features/music/controller/music_list_controller.dart';
import 'package:poem/src/features/poems/controller/poems_controller.dart';

/// {@template authenticated_dependencies_scope}
/// AuthenticatedDependenciesScope widget.
/// {@endtemplate}
class AuthenticatedDependenciesScope extends StatefulWidget {
  /// {@macro authenticated_dependencies_scope}
  const AuthenticatedDependenciesScope({
    required this.child,
    super.key, // ignore: unused_element
  });

  /// This widget will have access to the dependencies provided by this scope.
  final Widget child;

  /// Get the dependencies from the [context].
  static AuthenticatedDependencies of(BuildContext context) => context
      .inhOf<_InheritedAuthenticatedDependencies>(listen: false)
      .dependencies;

  @override
  State<AuthenticatedDependenciesScope> createState() =>
      _AuthenticatedDependenciesScopeState();
}

/// State for widget AuthenticatedDependenciesScope.
class _AuthenticatedDependenciesScopeState
    extends State<AuthenticatedDependenciesScope> {
  final dependencies = AuthenticatedDependencies();

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    final globalDependencies = context.dependencies;

    dependencies.poemsController = PoemsController(
      repository: globalDependencies.poemsRepository,
      initialState: PoemsState.initial(
        poems: [],
      ),
    )..query();

    dependencies.musicListController = MusicListController(
      repository: globalDependencies.musicRepository,
      initialState: MusicListState.initial(
        musicList: [],
      ),
    )..query();
  }

  @override
  void dispose() {
    dependencies.poemsController.dispose();

    dependencies.musicListController.dispose();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedAuthenticatedDependencies(
        dependencies: dependencies,
        child: widget.child,
      );
}

/// {@template inherited_authenticated_dependencies}
/// _InheritedAuthenticatedDependencies widget.
/// {@endtemplate}
class _InheritedAuthenticatedDependencies extends InheritedWidget {
  /// {@macro inherited_authenticated_dependencies}
  const _InheritedAuthenticatedDependencies({
    required super.child,
    required this.dependencies,
    super.key, // ignore: unused_element
  });

  final AuthenticatedDependencies dependencies;

  @override
  bool updateShouldNotify(
          covariant _InheritedAuthenticatedDependencies oldWidget) =>
      false;
}
