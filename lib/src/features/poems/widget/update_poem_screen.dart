import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/state_controller_processing_builder.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/model/music.dart';
import 'package:poem/src/features/music/widget/background_music_screen.dart';
import 'package:poem/src/features/music/widget/selected_music_widget.dart';
import 'package:poem/src/features/poems/controller/update_poem_controller.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/model/poem_data.dart';
import 'package:poem/src/features/poems/widget/create_poem_cover.dart';
import 'package:poem/src/features/poems/widget/create_poem_settings_bottom_modal_sheet.dart';
import 'package:poem/src/features/poems/widget/select_font_bottom_modal_sheet.dart';
import 'package:poem/src/features/poems/widget/speech_to_text_dialog.dart';

/// {@template update_poem_screen}
/// UpdatePoemScreen widget.
/// {@endtemplate}
class UpdatePoemScreen extends StatefulWidget {
  /// {@macro update_poem_screen}
  const UpdatePoemScreen({
    required this.poem,
    super.key, // ignore: unused_element
  });

  /// Poem to update.
  final Poem poem;

  @override
  State<UpdatePoemScreen> createState() => _UpdatePoemScreenState();
}

/// State for widget UpdatePoemScreen.
class _UpdatePoemScreenState extends State<UpdatePoemScreen> with _UpdatePoemScreenStateMixin {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _updatePoemController.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, child) => PopScope(
          canPop: !isProcessing,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Update Poem'),
              centerTitle: false,
              actions: [
                StateControllerProcessingBuilder(
                  stateController: _updatePoemController,
                  isProcessing: (state) => state.isProcessing,
                  builder: (context, isProcessing) => IconButton(
                    onPressed: isProcessing
                        ? null
                        : () => CreatePoemSettingsBottomModalSheet.show(
                              context,
                              onPressChangeCover: _onPressSelectImage,
                              onPressChangeFontFamily: _onPressSelectFont,
                              onPressChangeMusic: _onPressSelectMusic,
                              onPressCheckPoem: () {},
                            ),
                    icon: const Icon(
                      Icons.settings,
                    ),
                  ),
                ),
                StateControllerProcessingBuilder(
                  stateController: _updatePoemController,
                  isProcessing: (state) => state.isProcessing,
                  builder: (context, isProcessing) => IconButton(
                    onPressed: isProcessing ? null : _onPressSave,
                    icon: const Icon(
                      Icons.save,
                    ),
                  ),
                ),
                StateControllerProcessingBuilder(
                  stateController: _updatePoemController,
                  isProcessing: (state) => state.isProcessing,
                  builder: (context, isProcessing) => IconButton(
                    onPressed: isProcessing ? null : _onPressMic,
                    icon: const Icon(
                      Icons.mic,
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
                  ListenableBuilder(
                    listenable: Listenable.merge(
                      [
                        _localImage,
                        _imageUrl,
                      ],
                    ),
                    builder: (context, _) => CreatePoemCover(
                      enabled: !isProcessing,
                      imagePath: _localImage.value?.path,
                      imageUrl: _imageUrl.value,
                      onRemove: () {
                        _localImage.value = null;
                        _imageUrl.value = null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: StateControllerProcessingBuilder(
                      stateController: _updatePoemController,
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
                    child: ValueListenableBuilder(
                      valueListenable: _selectedFontFamily,
                      builder: (context, fontFamily, _) {
                        final font = fontFamily != null
                            ? GoogleFonts.getFont(
                                fontFamily,
                                textStyle: context.typography.bodyLarge,
                              )
                            : context.typography.bodyLarge;

                        return TextField(
                          enabled: !isProcessing,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          focusNode: _contentFocusNode,
                          controller: _contentController,
                          style: font,
                          decoration: const InputDecoration(
                            hintText: 'Enter your poem here...',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            filled: false,
                          ),
                        );
                      },
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _music,
                    builder: (context, music, _) {
                      if (music != null) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SelectedMusicWidget(
                            enabled: !isProcessing,
                            title: music.title,
                            url: music.url,
                            onRemovePressed: () => _music.value = null,
                            onMusicPressed: _onPressSelectMusic,
                          ),
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  ListenableBuilder(
                    listenable: Listenable.merge(
                      [
                        _titleFocusNode,
                        _contentFocusNode,
                      ],
                    ),
                    builder: (context, _) {
                      final keyboardIsOpen = _titleFocusNode.hasFocus || _contentFocusNode.hasFocus;
                      if (!keyboardIsOpen) return const SizedBox.shrink();

                      return SizedBox(
                        height: 48.0,
                        child: Ink(
                          color: context.colors.surface,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  _titleFocusNode.unfocus();
                                  _contentFocusNode.unfocus();
                                },
                                child: const Text(
                                  'Done',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

mixin _UpdatePoemScreenStateMixin on State<UpdatePoemScreen> {
  late final TextEditingController _titleController;

  late final FocusNode _titleFocusNode = FocusNode();

  late final TextEditingController _contentController;

  late final FocusNode _contentFocusNode = FocusNode();

  late final UpdatePoemController _updatePoemController;

  late final ValueNotifier<String?> _selectedFontFamily;

  late final ValueNotifier<Music?> _music;

  late final ValueNotifier<File?> _localImage;

  late final ValueNotifier<String?> _imageUrl;

  void _onUpdatePoemStateChanged() {
    final state = _updatePoemController.state;

    if (!mounted) return;
    if (state.isFailed) ErrorUtil.showSnackBar(context, state.message);
    if (state.isSucceeded) {
      final poemsController = AuthenticatedDependenciesScope.of(context).poemsController;

      final updatedPoem = state.poem;
      poemsController.updatePoem(updatedPoem);
      Navigator.pop(context, updatedPoem);
    }
  }

  void _onPressSave() {
    final text = _titleController.text;
    if (text.isEmpty) return;

    final content = _contentController.text;
    if (content.isEmpty) return;

    _updatePoemController.updatePoem(
      data: PoemData(
        title: text,
        content: content,
        music: _music.value,
        cover: _localImage.value?.path,
        originalCover: _imageUrl.value,
        fontFamily: _selectedFontFamily.value,
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

  Future<void> _onPressSelectFont() async {
    final font = await SelectFontBottomModalSheet.show(
      context,
      selectedFontFamily: _selectedFontFamily.value,
    );

    if (font == null) return;
    if (!mounted) return;

    _selectedFontFamily.value = font;
  }

  Future<void> _onPressSelectImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (result == null) return;

    final file = File(result.path);
    if (!mounted) return;

    _localImage.value = file;
  }

  Future<void> _onPressMic() async {
    final transcription = await SpeechToTextDialog.show(
      context,
      content: _contentController.text,
    );

    if (transcription == null) return;

    if (!mounted) return;

    final sb = StringBuffer();

    sb.write(_contentController.text);
    if (sb.isNotEmpty) sb.write('\n');
    sb.write(transcription);

    _contentController.text = sb.toString();

    _contentFocusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.poem.title,
      ),
    );
    _contentController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.poem.content,
      ),
    );

    _updatePoemController = UpdatePoemController(
      repository: context.dependencies.poemsRepository,
      initialState: UpdatePoemState.initial(
        poem: widget.poem,
      ),
    )..addListener(
        _onUpdatePoemStateChanged,
      );

    _selectedFontFamily = ValueNotifier<String?>(widget.poem.fontFamily);
    _music = ValueNotifier<Music?>(widget.poem.music);
    _localImage = ValueNotifier<File?>(null);
    _imageUrl = ValueNotifier<String?>(widget.poem.cover);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    _titleFocusNode.dispose();
    _contentFocusNode.dispose();

    _updatePoemController.removeListener(_onUpdatePoemStateChanged);
    _updatePoemController.dispose();

    _music.dispose();

    super.dispose();
  }
}
