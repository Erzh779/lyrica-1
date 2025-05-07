import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:octopus/octopus.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/core/widget/state_controller_processing_builder.dart';
import 'package:poem/src/core/widget/ui_text_field.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/model/music.dart';
import 'package:poem/src/features/music/widget/background_music_screen.dart';
import 'package:poem/src/features/music/widget/selected_music_widget.dart';
import 'package:poem/src/features/poems/controller/create_poem_controller.dart';
import 'package:poem/src/features/poems/model/create_poem_data.dart';
import 'package:poem/src/features/poems/widget/create_poem_settings_bottom_modal_sheet.dart';
import 'package:poem/src/features/poems/widget/select_font_bottom_modal_sheet.dart';

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
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create Poem'),
              centerTitle: false,
              actions: [
                StateControllerProcessingBuilder(
                  stateController: _createPoemController,
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
                  ValueListenableBuilder(
                    valueListenable: _image,
                    builder: (context, image, _) {
                      if (image == null) return const SizedBox.shrink();

                      return AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
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
                      final keyboardIsOpen = _titleFocusNode.hasFocus ||
                          _contentFocusNode.hasFocus;
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

mixin _CreatePoemScreenStateMixin on State<CreatePoemScreen> {
  late final TextEditingController _titleController;

  late final FocusNode _titleFocusNode = FocusNode();

  late final TextEditingController _contentController;

  late final FocusNode _contentFocusNode = FocusNode();

  late final CreatePoemController _createPoemController;

  final ValueNotifier<String?> _selectedFontFamily =
      ValueNotifier<String?>(null);

  final ValueNotifier<Music?> _music = ValueNotifier(null);

  final ValueNotifier<File?> _image = ValueNotifier(null);

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

  void _onPressSave() {
    final text = _titleController.text;
    if (text.isEmpty) return;

    final content = _contentController.text;
    if (content.isEmpty) return;

    _createPoemController.submit(
      CreatePoemData(
        title: text,
        content: content,
        music: _music.value,
        cover: _image.value?.path,
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

    _image.value = file;
  }

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
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    _titleFocusNode.dispose();
    _contentFocusNode.dispose();

    _createPoemController.removeListener(_onCreatePoemStateChanged);
    _createPoemController.dispose();

    _music.dispose();

    super.dispose();
  }
}
