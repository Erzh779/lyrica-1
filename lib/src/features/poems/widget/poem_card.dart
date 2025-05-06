import 'package:flutter/material.dart';
import 'package:poem/src/core/extension/build_context.dart';
import 'package:poem/src/core/widget/ui_text.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/widget/poem_screen.dart';

/// {@template poem_card}
/// PoemCard widget.
/// {@endtemplate}
class PoemCard extends StatelessWidget {
  /// {@macro poem_card}
  const PoemCard({
    required this.poem,
    super.key, // ignore: unused_element
  });

  /// Poem to display.
  final Poem poem;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 124,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => PoemScreen(
                poem: poem,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UiText.bodyLarge(
                        poem.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      UiText.bodySmall(
                        poem.createdAt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: context.colors.gray500,
                      ),
                      Spacer(),
                      Ink(
                        decoration: BoxDecoration(
                          color: context.colors.gray300,
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 16.0,
                          ),
                          child: UiText.bodySmall(
                            'View',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Ink(
                    decoration: BoxDecoration(
                      color: context.colors.gray100,
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
