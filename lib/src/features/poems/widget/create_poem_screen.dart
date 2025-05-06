import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/state_controller_processing_builder.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/model/music.dart';
import 'package:poem/src/features/music/widget/background_music_screen.dart';
import 'package:poem/src/features/poems/controller/create_poem_controller.dart';
import 'package:poem/src/features/poems/model/create_poem_data.dart';
import 'package:poem/src/features/poems/widget/selected_music_widget.dart';

/// {@template create_poem_screen}
/// CreatePoemScreen widget.
/// {@endtemplate}
class CreatePoemScreen extends StatefulWidget {
  /// {@macro create_poem_screen}
  const CreatePoemScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<CreatePoemScreen> createState() => _CreatePoemScreenState();
}

/// State for widget CreatePoemScreen.
class _CreatePoemScreenState extends State<CreatePoemScreen>
    with _CreatePoemScreenStateMixin {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _createPoemController.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, child) => PopScope(
          canPop: !isProcessing,
          child: child!,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Poem'),
            actions: [
              StateControllerProcessingBuilder(
                stateController: _createPoemController,
                isProcessing: (state) => state.isProcessing,
                builder: (context, isProcessing) => TextButton(
                  onPressed: isProcessing ? null : _onPressSave,
                  child: const Text(
                    'Save',
                  ),
                ),
              ),
            ],
            actionsPadding: const EdgeInsets.only(
              right: 16.0,
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: StateControllerProcessingBuilder(
                    stateController: _createPoemController,
                    isProcessing: (state) => state.isProcessing,
                    builder: (context, isProcessing) => UiTextField.primary(
                      hintText: 'Title',
                      enabled: !isProcessing,
                      controller: _titleController,
                      focusNode: _titleFocusNode,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    focusNode: _contentFocusNode,
                    controller: _contentController,
                    onTapOutside: (event) => _contentFocusNode.unfocus(),
                    decoration: const InputDecoration(
                      hintText: 'Enter your poem here...',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListenableBuilder(
                        listenable: Listenable.merge([
                          _music,
                          _playerState,
                        ]),
                        builder: (context, _) {
                          final music = _music.value;
                          final playerState = _playerState.value;

                          if (music != null) {
                            return SelectedMusicWidget(
                              title: music.title,
                              onRemovePressed: () => _music.value = null,
                              onMusicPressed: _onPressSelectMusic,
                              isPlaying: playerState == PlayerState.playing,
                              onPlayPausePressed: () {
                                if (_audioPlayer.state == PlayerState.playing) {
                                  _audioPlayer.pause().then(
                                    (_) {
                                      if (!mounted) return null;
                                      return _playerState.value =
                                          PlayerState.paused;
                                    },
                                  );
                                } else {
                                  _audioPlayer.resume().then(
                                    (_) {
                                      if (!mounted) return null;
                                      return _playerState.value =
                                          PlayerState.playing;
                                    },
                                  );
                                }
                              },
                            );
                          }

                          return UiButton.secondary(
                            onPressed: _onPressSelectMusic,
                            label: const Text(
                              'Select Background Music',
                            ),
                          );
                        },
                      ),
                      Row(
                        spacing: 8.0,
                        children: [
                          Expanded(
                            child: UiButton.secondary(
                              onPressed: () {},
                              label: const Text(
                                'Change Font',
                              ),
                            ),
                          ),
                          Expanded(
                            child: UiButton.primary(
                              onPressed: () {},
                              label: const Text(
                                'Auto Edit punctuation',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

mixin _CreatePoemScreenStateMixin on State<CreatePoemScreen> {
  late final TextEditingController _titleController;

  late final FocusNode _titleFocusNode = FocusNode();

  late final TextEditingController _contentController;

  late final FocusNode _contentFocusNode = FocusNode();

  late final CreatePoemController _createPoemController;

  final ValueNotifier<Music?> _music = ValueNotifier(null);

  late final AudioPlayer _audioPlayer;

  StreamSubscription<AudioEvent>? _audioPlayerSubscription;

  final ValueNotifier<PlayerState> _playerState = ValueNotifier(
    PlayerState.stopped,
  );

  void _onCreatePoemStateChanged() {
    final state = _createPoemController.state;

    if (!mounted) return;
    if (state.isFailed) ErrorUtil.showSnackBar(context, state.message);
    if (state.isSucceeded) {
      final poemsController =
          AuthenticatedDependenciesScope.of(context).poemsController;
      poemsController.addPoem(state.poem!);
      context.octopus.pop();
    }
  }

  void _onMusicChanged() {
    final music = _music.value;
    if (music == null) {
      if (_audioPlayer.state == PlayerState.playing) {
        _audioPlayer.stop().then(
          (_) {
            if (!mounted) return null;
            return _playerState.value = PlayerState.stopped;
          },
        );
      }

      return;
    }

    _audioPlayer.setSourceUrl(music.url);
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void _onPlayerEvent(
    AudioEvent event,
  ) {
    if (event.eventType == AudioEventType.complete) {
      _playerState.value = PlayerState.stopped;
    }
  }

  void _onPressSave() {
    final text = _titleController.text;
    if (text.isEmpty) return;

    final content = _contentController.text;
    if (content.isEmpty) return;

    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.pause().then(
        (_) {
          if (!mounted) return null;
          return _playerState.value = PlayerState.paused;
        },
      );
    }

    _createPoemController.submit(
      CreatePoemData(
        title: text,
        content: content,
        music: _music.value,
      ),
    );
  }

  void _onPressSelectMusic() => Navigator.push(
        context,
        MaterialPageRoute<Music>(
          builder: (context) => const BackgroundMusicScreen(),
        ),
      ).then(
        (value) {
          if (!mounted) return;

          if (value != null) _music.value = value;
        },
      );

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _contentController = TextEditingController();

    _createPoemController = CreatePoemController(
      repository: context.dependencies.poemsRepository,
      initialState: CreatePoemState.initial(),
    )..addListener(
        _onCreatePoemStateChanged,
      );

    _audioPlayer = AudioPlayer(
      playerId: 'poem_background_music_player',
    );

    _audioPlayerSubscription = _audioPlayer.eventStream.listen(
      _onPlayerEvent,
    );

    _music.addListener(
      _onMusicChanged,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    _titleFocusNode.dispose();
    _contentFocusNode.dispose();

    _createPoemController.removeListener(_onCreatePoemStateChanged);
    _createPoemController.dispose();

    _music.removeListener(_onMusicChanged);
    _music.dispose();

    _audioPlayerSubscription?.cancel();
    _audioPlayer.dispose();

    super.dispose();
  }
}
