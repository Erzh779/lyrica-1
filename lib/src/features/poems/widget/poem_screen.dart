import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:control/control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/features/auth/widget/auth_scope.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/widget/selected_music_widget.dart';
import 'package:poem/src/features/poems/controller/poem_controller.dart';
import 'package:poem/src/features/poems/controller/poems_controller.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/widget/text_to_speech_dialog.dart';
import 'package:poem/src/features/poems/widget/update_poem_screen.dart';
import 'package:share_plus/share_plus.dart';

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
  Widget build(BuildContext context) => StateConsumer<PoemController, PoemState>(
        controller: _poemController,
        builder: (context, state, _) {
          final isProcessing = state.isProcessing;
          final poem = state.poem;

          return Scaffold(
            appBar: AppBar(
              title: Text(poem.title),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                  onPressed: isProcessing
                      ? null
                      : () {
                          setState(() => _isTtsOpen = true);
                          TextToSpeechDialog.show(
                            context,
                            id: poem.id,
                            content: poem.content,
                          ).whenComplete(
                            () => setState(
                              () => _isTtsOpen = false,
                            ),
                          );
                        },
                ),
                Builder(
                  builder: (context) {
                    final isOwn = AuthScope.isSameId(context, poem.authorId);

                    return PopupMenuButton<String>(
                      enabled: !isProcessing,
                      borderRadius: BorderRadius.circular(12.0),
                      itemBuilder: (context) => [
                        if (isOwn)
                          PopupMenuItem<String>(
                            value: 'edit',
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Edit',
                                  ),
                                ),
                                Icon(
                                  Icons.edit_rounded,
                                  size: 16.0,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                        if (isOwn)
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Delete',
                                  ),
                                ),
                                Icon(
                                  Icons.delete_rounded,
                                  size: 16.0,
                                  color: context.theme.colorScheme.error,
                                ),
                              ],
                            ),
                          ),
                        PopupMenuItem<String>(
                          value: 'share',
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Share',
                                ),
                              ),
                              Icon(
                                Platform.isIOS ? CupertinoIcons.share : Icons.share_rounded,
                                size: 16.0,
                                color: context.theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                      onSelected: isProcessing
                          ? null
                          : (value) {
                              switch (value) {
                                case 'edit':
                                  _onPressEdit();
                                case 'delete':
                                  _onPressDelete();
                                case 'share':
                                  _onPressShare();
                              }
                            },
                      icon: const Icon(
                        Icons.more_vert_rounded,
                      ),
                    );
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (poem.cover != null)
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl: poem.cover!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        poem.content,
                        style: poem.fontFamily != null
                            ? GoogleFonts.getFont(
                                poem.fontFamily!,
                                textStyle: context.typography.bodyLarge,
                              )
                            : context.typography.bodyLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  if (poem.music != null)
                    Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: SelectedMusicWidget(
                        enabled: !_isTtsOpen,
                        title: poem.music!.title,
                        url: poem.music!.url,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
}

mixin _PoemScreenStateMixin on State<PoemScreen> {
  late final PoemController _poemController;

  late final PoemsController _poemsController;

  bool _isTtsOpen = false;

  void _onPoemControllerStateChanged() {
    final state = _poemController.state;

    if (state.isDeleted) {
      _poemsController.deletePoem(state.poem);
      Navigator.pop(context);
    }
  }

  void _onPressShare() {
    final sb = StringBuffer();

    final poem = _poemController.state.poem;

    sb.writeln('Title: ${poem.title}');
    sb.writeln('${poem.content}');

    SharePlus.instance.share(
      ShareParams(
        text: sb.toString(),
      ),
    );
  }

  Future<void> _onPressEdit() async {
    final poem = _poemController.state.poem;

    final updatedPoem = await Navigator.push(
      context,
      MaterialPageRoute<Poem?>(
        builder: (context) => UpdatePoemScreen(
          poem: poem,
        ),
      ),
    );

    if (!mounted) return;
    if (updatedPoem != null) _poemController.updatePoem(updatedPoem);
  }

  void _onPressDelete() {
    final poem = _poemController.state.poem;

    _poemController.deletePoem(
      poem,
    );
  }

  @override
  void initState() {
    super.initState();

    final poemRepository = context.dependencies.poemsRepository;
    _poemController = PoemController(
      repository: poemRepository,
      initialState: PoemState.idle(
        poem: widget.poem,
      ),
    )..addListener(
        _onPoemControllerStateChanged,
      );

    _poemsController = AuthenticatedDependenciesScope.of(context).poemsController;
  }

  @override
  void dispose() {
    _poemController.removeListener(
      _onPoemControllerStateChanged,
    );
    _poemController.dispose();

    super.dispose();
  }
}
