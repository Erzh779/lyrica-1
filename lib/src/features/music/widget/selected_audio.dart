import 'dart:io';

import 'package:flutter/material.dart';

/// {@template selected_audio}
/// SelectedAudio widget.
/// {@endtemplate}
class SelectedAudio extends StatelessWidget {
  /// {@macro selected_audio}
  const SelectedAudio({
    required this.file,
    super.key, // ignore: unused_element
  });

  /// The audio file selected.
  final File file;

  @override
  Widget build(BuildContext context) => Ink(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.audiotrack,
              color: Colors.white,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                file.path.split('/').last,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
