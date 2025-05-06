import 'package:control/control.dart';
import 'package:flutter/material.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/poems/controller/poems_controller.dart';
import 'package:poem/src/features/poems/widget/poem_card.dart';

/// {@template poems_list_view}
/// PoemsListView widget.
/// {@endtemplate}
class PoemsListView extends StatelessWidget {
  /// {@macro poems_list_view}
  const PoemsListView({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    final poemsController =
        AuthenticatedDependenciesScope.of(context).poemsController;

    return StateConsumer<PoemsController, PoemsState>(
      controller: poemsController,
      builder: (context, state, child) {
        final isProcessing = state.isProcessing;
        final poems = state.poems;

        if (poems.isEmpty && isProcessing) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (poems.isEmpty) {
          return const Center(
            child: Text('No poems found.'),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          itemCount: poems.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final poem = poems[index];

            return PoemCard(
              poem: poem,
            );
          },
        );
      },
    );
  }
}
