import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/features/auth/widget/auth_scope.dart';
import 'package:poem/src/features/dependencies/widget/authenticated_dependencies_scope.dart';
import 'package:poem/src/features/music/widget/selected_music_widget.dart';
import 'package:poem/src/features/poems/controller/poem_controller.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/widget/text_to_speech_dialog.dart';
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
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _poemController.select(
          (state) => state.isProcessing,
        ),
        builder: (context, isProcessing, _) => Scaffold(
          appBar: AppBar(
            title: Text(widget.poem.title),
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
                          id: widget.poem.id,
                          content: widget.poem.content,
                        ).whenComplete(
                          () => setState(
                            () => _isTtsOpen = false,
                          ),
                        );
                      },
              ),
              Builder(
                builder: (context) {
                  final isSameId = AuthScope.isSameId(context, widget.poem.authorId);

                  if (!isSameId) return const SizedBox.shrink();

                  return IconButton(
                    icon: const Icon(
                      Icons.delete_rounded,
                    ),
                    onPressed: isProcessing ? null : () => _poemController.deletePoem(widget.poem),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.share_rounded,
                ),
                onPressed: isProcessing ? null : _onPressShare,
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.poem.cover != null)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedNetworkImage(
                      imageUrl: widget.poem.cover!,
                      fit: BoxFit.cover,
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.poem.content,
                      style: widget.poem.fontFamily != null
                          ? GoogleFonts.getFont(
                              widget.poem.fontFamily!,
                              textStyle: context.typography.bodyLarge,
                            )
                          : context.typography.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                if (widget.poem.music != null)
                  Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: SelectedMusicWidget(
                      enabled: !_isTtsOpen,
                      title: widget.poem.music!.title,
                      url: widget.poem.music!.url,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}

mixin _PoemScreenStateMixin on State<PoemScreen> {
  late final PoemController _poemController;

  bool _isTtsOpen = false;

  void _onPoemControllerStateChanged() {
    final state = _poemController.state;

    if (state.isDeleted) {
      final poemsController = AuthenticatedDependenciesScope.of(context).poemsController;
      poemsController.deletePoem(widget.poem);
      Navigator.pop(context);
    }
  }

  void _onPressShare() {
    final sb = StringBuffer();

    sb.writeln('Title: ${widget.poem.title}');
    sb.writeln('${widget.poem.content}');

    SharePlus.instance.share(
      ShareParams(
        text: sb.toString(),
      ),
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
