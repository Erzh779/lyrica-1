import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/widget/selected_music_widget.dart';

/// {@template poem_screen}
/// PoemScreen widget.
/// {@endtemplate}
class PoemScreen extends StatefulWidget {
  /// {@macro poem_screen}
  const PoemScreen({
    required this.poem,
    super.key, // ignore: unused_element
  });

  /// Poem to display.
  final Poem poem;

  @override
  State<PoemScreen> createState() => _PoemScreenState();
}

/// State for widget PoemScreen.
class _PoemScreenState extends State<PoemScreen> with _PoemScreenStateMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.poem.title),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.poem.content,
                    style: context.typography.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              if (widget.poem.music != null)
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: _isPlaying,
                    builder: (context, isPlaying, child) => SelectedMusicWidget(
                      title: widget.poem.music!.title,
                      onPlayPausePressed: _onPlayPausePressed,
                      isPlaying: isPlaying,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}

mixin _PoemScreenStateMixin on State<PoemScreen> {
  late final AudioPlayer _audioPlayer;

  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);

  StreamSubscription<AudioEvent>? _audioPlayerSubscription;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();

    if (widget.poem.music != null) {
      _audioPlayer.setSourceUrl(widget.poem.music!.url);
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
    }

    _audioPlayerSubscription = _audioPlayer.eventStream.listen(
      (event) {
        if (event.eventType == AudioEventType.complete) {
          _isPlaying.value = false;
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _audioPlayerSubscription?.cancel();

    _audioPlayer.dispose();

    super.dispose();
  }

  void _onPlayPausePressed() {
    if (_isPlaying.value) {
      _audioPlayer.pause().then((_) {
        if (!mounted) return;
        _isPlaying.value = false;
      });
    } else {
      _audioPlayer.resume().then((_) {
        if (!mounted) return;
        _isPlaying.value = true;
      });
    }

    _isPlaying.value = !_isPlaying.value;
  }
}
