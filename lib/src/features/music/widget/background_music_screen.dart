import 'package:flutter/material.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/features/music/model/music.dart';
import 'package:poem/src/features/music/widget/create_music_screen.dart';
import 'package:poem/src/features/music/widget/music_list_view.dart';

/// {@template background_music_screen}
/// BackgroundMusicScreen widget.
/// {@endtemplate}
class BackgroundMusicScreen extends StatelessWidget {
  /// {@macro background_music_screen}
  const BackgroundMusicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Background Music'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MusicListView(
                  onMusicPressed: (music) => Navigator.pop(
                    context,
                    music,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: UiButton.secondary(
                  onPressed: () async {
                    final music = await Navigator.push(
                      context,
                      MaterialPageRoute<Music>(
                        builder: (context) => const CreateMusicScreen(),
                      ),
                    );

                    if (!context.mounted) return;
                    if (music == null) return;

                    Navigator.pop(context, music);
                  },
                  label: const Text(
                    'Add Music',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
