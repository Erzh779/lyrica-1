import 'dart:math' as math;

import 'package:control/control.dart';
import 'package:flutter/material.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/controller/music_list_controller.dart';
import 'package:poem/src/features/music/model/music.dart';

/// {@template music_list_view}
/// MusicListView widget.
/// {@endtemplate}
class MusicListView extends StatelessWidget {
  /// {@macro music_list_view}
  const MusicListView({
    this.onMusicPressed,
    this.maxCount,
    super.key, // ignore: unused_element
  });

  /// Maximum number of items to display.
  /// If null, all items will be displayed.
  final int? maxCount;

  /// Callback when a music item is pressed.
  final ValueChanged<Music>? onMusicPressed;

  @override
  Widget build(BuildContext context) {
    final musicListController =
        AuthenticatedDependenciesScope.of(context).musicListController;

    return StateConsumer<MusicListController, MusicListState>(
      controller: musicListController,
      builder: (context, state, child) {
        final isProcessing = state.isProcessing;
        final musicList = state.musicList;

        if (musicList.isEmpty && isProcessing) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (musicList.isEmpty) {
          return const Center(
            child: Text('No music found.'),
          );
        }

        final length = math.min(
          maxCount ?? musicList.length,
          musicList.length,
        );

        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          itemCount: length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final music = musicList[index];

            return ListTile(
              onTap:
                  onMusicPressed != null ? () => onMusicPressed!(music) : null,
              title: Text(
                music.title,
              ),
              subtitle: Text(
                music.genre?.displayName ?? 'Unknown',
              ),
            );
          },
        );
      },
    );
  }
}
