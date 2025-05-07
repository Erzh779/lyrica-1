import 'dart:io';

import 'package:control/control.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/ui_button.dart';
import 'package:poem/src/core/widget/ui_text.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/controller/create_music_controller.dart';
import 'package:poem/src/features/music/controller/genres_controller.dart';
import 'package:poem/src/features/music/model/genre.dart';
import 'package:poem/src/features/music/widget/selected_music_widget.dart';

/// {@template create_music_screen}
/// CreateMusicScreen widget.
/// {@endtemplate}
class CreateMusicScreen extends StatefulWidget {
  /// {@macro create_music_screen}
  const CreateMusicScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<CreateMusicScreen> createState() => _CreateMusicScreenState();
}

/// State for widget CreateMusicScreen.
class _CreateMusicScreenState extends State<CreateMusicScreen>
    with _CreateMusicScreenStateMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Music',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: ValueListenableBuilder(
              valueListenable: _createMusicController.select(
                (state) => state.isProcessing,
              ),
              builder: (context, isProcessing, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 16.0,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        UiTextField.primary(
                          hintText: 'Title of the music',
                          controller: _controller,
                          enabled: !isProcessing,
                        ),
                        ValueListenableBuilder(
                          valueListenable: _file,
                          builder: (context, file, child) {
                            if (file != null) {
                              final fileName = path.basename(file.path);

                              return SelectedMusicWidget(
                                title: fileName,
                                enabled: !isProcessing,
                                path: file.path,
                                onRemovePressed: () => _file.value = null,
                              );
                            }

                            return UiButton.secondary(
                              enabled: !isProcessing,
                              onPressed: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.audio,
                                );

                                if (!mounted) return;

                                final firstFile = result?.files.firstOrNull;
                                if (firstFile == null) return;

                                final file = File(firstFile.path!);
                                _file.value = file;
                              },
                              label: Text(
                                'Select Audio',
                              ),
                            );
                          },
                        ),
                        StateConsumer<GenresController, GenresState>(
                          controller: _genresController,
                          builder: (context, state, child) {
                            final enabled =
                                !state.isProcessing && !isProcessing;

                            final genres = state.genres;

                            return Row(
                              spacing: 16.0,
                              children: [
                                Expanded(
                                  child: UiText.bodyMedium(
                                    'Genre',
                                    color:
                                        enabled ? null : context.colors.gray500,
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _genre,
                                  builder: (context, genre, _) =>
                                      DropdownButtonHideUnderline(
                                    child: DropdownButton<Genre>(
                                      value: genre,
                                      items: genres
                                          .map(
                                            (genre) => DropdownMenuItem<Genre>(
                                              value: genre,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: UiText.bodyMedium(
                                                  genre.displayName,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: enabled
                                          ? (genre) => _genre.value = genre
                                          : null,
                                      borderRadius: BorderRadius.circular(
                                        12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  UiButton.primary(
                    enabled: !isProcessing,
                    showProcessing: isProcessing,
                    onPressed: _onPressSave,
                    label: const Text(
                      'Save',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

mixin _CreateMusicScreenStateMixin on State<CreateMusicScreen> {
  late final TextEditingController _controller;

  late final CreateMusicController _createMusicController;

  late final GenresController _genresController;

  final ValueNotifier<Genre?> _genre = ValueNotifier(null);

  final ValueNotifier<File?> _file = ValueNotifier(null);

  void _onCreateMusicControllerStateChanged() {
    final state = _createMusicController.state;

    if (!mounted) return;

    if (state.isSucceeded) {
      final music = state.music!;

      final musicListController =
          AuthenticatedDependenciesScope.of(context).musicListController;

      musicListController.addMusic(music);
      Navigator.pop(context, music);
    } else if (state.isFailed) {
      ErrorUtil.showSnackBar(
        context,
        state.message,
      );
    }
  }

  void _onGenresControllerStateChanged() {
    final state = _genresController.state;

    if (!mounted) return;

    if (state.isFailed) {
      ErrorUtil.showSnackBar(
        context,
        state.message,
      );
    }

    if (_genre.value == null) {
      _genre.value = state.genres.firstOrNull;
    }
  }

  void _onPressSave() {
    final title = _controller.text.trim();
    if (title.isEmpty) {
      ErrorUtil.showSnackBar(
        context,
        'Please enter a title.',
      );
      return;
    }

    final genre = _genre.value;
    if (genre == null) {
      ErrorUtil.showSnackBar(
        context,
        'Please select a genre.',
      );
      return;
    }

    final file = _file.value;
    if (file == null) {
      ErrorUtil.showSnackBar(
        context,
        'Please select a file.',
      );
      return;
    }

    _createMusicController.createMusic(
      title: title,
      genre: genre,
      file: file,
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _createMusicController = CreateMusicController(
      repository: context.dependencies.musicRepository,
      initialState: CreateMusicState.initial(),
    )..addListener(
        _onCreateMusicControllerStateChanged,
      );

    _genresController = GenresController(
      repository: context.dependencies.musicRepository,
      initialState: GenresState.initial(
        genres: [],
      ),
    );

    _genresController.addListener(
      _onGenresControllerStateChanged,
    );

    _genresController.query();
  }

  @override
  void dispose() {
    _controller.dispose();

    _createMusicController.removeListener(
      _onCreateMusicControllerStateChanged,
    );
    _createMusicController.dispose();

    _genresController.removeListener(
      _onGenresControllerStateChanged,
    );
    _genresController.dispose();

    super.dispose();
  }
}
