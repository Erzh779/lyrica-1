import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';

/// {@template selected_music_widget}
/// SelectedMusicWidget widget.
/// {@endtemplate}
class SelectedMusicWidget extends StatelessWidget {
  /// {@macro selected_music_widget}
  const SelectedMusicWidget({
    required this.title,
    this.onRemovePressed,
    this.onMusicPressed,
    this.isPlaying = false,
    this.onPlayPausePressed,
    super.key, // ignore: unused_element
  });

  /// Title to be displayed.
  final String title;

  /// Callback when the remove button is pressed.
  final VoidCallback? onRemovePressed;

  /// Callback when the music is pressed.
  final VoidCallback? onMusicPressed;

  /// Callback when the play/pause button is pressed.
  final VoidCallback? onPlayPausePressed;

  /// Whether the music is currently playing.
  final bool isPlaying;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 52.0,
        child: InkWell(
          onTap: onMusicPressed,
          borderRadius: BorderRadius.circular(12.0),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: context.colors.primary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: onPlayPausePressed,
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: isPlaying ? Colors.green : Colors.blue,
                    ),
                  ),
                  if (onRemovePressed != null)
                    IconButton(
                      onPressed: onRemovePressed,
                      icon: const Icon(Icons.close),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
