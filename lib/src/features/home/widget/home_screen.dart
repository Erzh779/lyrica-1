import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/router/routes.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_icon_button.dart';
import 'package:poem/src/features/poems/widget/poems_list_view.dart';

/// {@template home_screen}
/// HomeScreen widget.
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  /// {@macro home_screen}
  const HomeScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State for widget HomeScreen.
class _HomeScreenState extends State<HomeScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My Poetry'), // TODO: Localize
          actions: [
            UiIconButton(
              onPressed: () => context.octopus.push(
                Routes.createPoem,
              ),
              icon: Icon(
                Icons.add_outlined,
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.only(
            right: 16.0,
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PoemsListView(),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.background,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ).copyWith(
                    bottom: MediaQuery.paddingOf(context).bottom + 16.0,
                  ),
                  child: UiButton.secondary(
                    onPressed: context.dependencies.authController.signOut,
                    isDestructive: true,
                    label: Text(
                      'Sign Out',
                    ), // TODO: Localize
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
