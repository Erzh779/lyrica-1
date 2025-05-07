import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_text.dart';

/// {@template selected_music_widget}
/// SelectedMusicWidget widget.
/// {@endtemplate}
class SelectedMusicWidget extends StatefulWidget {
  /// {@macro selected_music_widget}
  const SelectedMusicWidget({
    required this.title,
    this.enabled = true,
    this.onRemovePressed,
    this.onMusicPressed,
    this.path,
    this.url,
    super.key,
  }) : assert(
          (path != null && url == null) || (path == null && url != null),
          'Either path or url must be provided, but not both.',
        );

  /// Whether the widget is enabled.
  final bool enabled;

  /// The title of the music.
  final String title;

  /// The local path of the music.
  final String? path;

  /// The network URL of the music.
  final String? url;

  /// Callback when the remove button is pressed.
  final VoidCallback? onRemovePressed;

  /// Callback when the music is pressed.
  final VoidCallback? onMusicPressed;

  @override
  State<SelectedMusicWidget> createState() => _SelectedMusicWidgetState();
}

/// State for widget SelectedMusicWidget.
class _SelectedMusicWidgetState extends State<SelectedMusicWidget> {
  late final AudioPlayer _audioPlayer;

  StreamSubscription<bool>? _audioPlayerSubscription;

  final ValueNotifier<bool> _isPlaying = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _canPlay = ValueNotifier<bool>(false);

  Future<void> _setSource() async {
    _canPlay.value = false;

    if (widget.path != null) {
      await _audioPlayer.setFilePath(widget.path!);
    } else if (widget.url != null) {
      await _audioPlayer.setUrl(widget.url!);
    }

    _canPlay.value = true;
  }

  void _onPlayerEvent(
    bool isPlaying,
  ) =>
      _isPlaying.value = isPlaying;

  void _onPlayPausePressed() {
    if (_isPlaying.value) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    _audioPlayer.setLoopMode(LoopMode.off);

    _audioPlayerSubscription = _audioPlayer.playingStream.listen(
      _onPlayerEvent,
      onDone: () {
        _audioPlayerSubscription?.cancel();
        _audioPlayerSubscription = null;
      },
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (!mounted) return;
        await _setSource();
      },
    );
  }

  @override
  void didUpdateWidget(SelectedMusicWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.path != widget.path || oldWidget.url != widget.url) {
      if (_isPlaying.value) {
        _audioPlayer.stop().then(
          (_) {
            if (!mounted) return;

            _isPlaying.value = false;
          },
        ).whenComplete(
          _setSource,
        );
      } else {
        _setSource();
      }
    }

    if (oldWidget.enabled != widget.enabled) {
      if (_isPlaying.value) {
        _audioPlayer.pause().then(
          (_) {
            if (!mounted) return;
            _isPlaying.value = false;
          },
        );
      }
    }
  }

  @override
  void dispose() {
    _audioPlayerSubscription?.cancel();
    _audioPlayer.dispose();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = widget.enabled ? colors.primary : colors.gray500;

    return SizedBox(
      height: 52.0,
      child: InkWell(
        onTap: widget.enabled ? widget.onMusicPressed : null,
        borderRadius: BorderRadius.circular(12.0),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: color,
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
                  child: UiText.bodyMedium(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: widget.enabled ? null : colors.gray500,
                  ),
                ),
                IconButton(
                  onPressed: widget.enabled ? _onPlayPausePressed : null,
                  icon: ValueListenableBuilder(
                    valueListenable: _isPlaying,
                    builder: (context, isPlaying, _) => Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: color,
                    ),
                  ),
                ),
                if (widget.onRemovePressed != null)
                  IconButton(
                    onPressed: widget.enabled ? widget.onRemovePressed : null,
                    icon: const Icon(
                      Icons.close,
                    ),
                    color: color,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
