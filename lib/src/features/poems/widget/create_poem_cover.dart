import 'dart:io';

import 'package:flutter/material.dart';

/// {@template create_poem_cover}
/// CreatePoemCover widget.
/// {@endtemplate}
class CreatePoemCover extends StatelessWidget {
  /// {@macro create_poem_cover}
  const CreatePoemCover({
    this.enabled = true,
    this.imagePath,
    this.onRemove,
    super.key, // ignore: unused_element
  });

  /// Whether the cover is enabled or not.
  final bool enabled;

  /// Path to the image.
  final String? imagePath;

  /// Callback when the remove button is pressed.
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
        child: imagePath != null
            ? Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                      ),
                      onPressed: enabled ? onRemove : null,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      );
}
