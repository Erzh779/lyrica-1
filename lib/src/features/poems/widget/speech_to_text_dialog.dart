import 'dart:io';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

/// {@template speech_to_text_dialog}
/// SpeechToTextDialog widget.
/// {@endtemplate}
class SpeechToTextDialog extends StatefulWidget {
  /// {@macro speech_to_text_dialog}
  const SpeechToTextDialog({
    required this.content,
    Key? key,
  }) : super(key: key);

  /// The content of the poem.
  final String content;

  /// Shows the speech-to-text dialog and returns the transcription result.
  static Future<String?> show(
    BuildContext context, {
    required String content,
  }) =>
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (_) => SpeechToTextDialog(
          content: content,
        ),
      );

  @override
  State<SpeechToTextDialog> createState() => _SpeechToTextDialogState();
}

class _SpeechToTextDialogState extends State<SpeechToTextDialog> {
  final _recorder = AudioRecorder();

  bool _isRecording = false;
  bool _isTranscribing = false;

  String? _transcription;
  String? _error;
  String? _filePath;

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      if (await _recorder.hasPermission()) {
        final dir = await getTemporaryDirectory();

        final uuid = const Uuid().v4();
        final filePath = path.join(dir.path, '$uuid.wav');

        await _recorder.start(
          RecordConfig(
            sampleRate: 16000,
            encoder: AudioEncoder.wav,
          ),
          path: filePath,
        );

        setState(() {
          _isRecording = true;
          _filePath = filePath;
          _error = null;
        });
      } else {
        setState(() {
          _error = 'No permission to record audio.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error starting recording: $e';
      });
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stop();
      setState(() => _isRecording = false);
    } catch (e) {
      setState(() => _error = 'Error stopping recording: $e');
    }
  }

  Future<void> _submit() async {
    setState(() {
      _isTranscribing = true;
      _error = null;
    });

    if (_filePath == null) {
      setState(() => _error = 'Audio file path is null.');
      return;
    }

    final file = File(_filePath!);
    if (!file.existsSync()) {
      setState(() => _error = 'Audio file does not exist.');
      return;
    }

    try {
      final result = await OpenAI.instance.audio.createTranscription(
        file: file,
        prompt: _promtBuilder(),
        temperature: 0,
        model: 'whisper-1',
      );

      setState(() {
        _transcription = result.text;
        _isTranscribing = false;
      });

      file.delete().ignore();

      Navigator.of(context).pop(result.text);
    } catch (e) {
      setState(() => _error = 'Connection error: $e');
    } finally {
      setState(() => _isTranscribing = false);
    }
  }

  String _promtBuilder() {
    final sb = StringBuffer();
    sb.writeln('Please transcribe the following audio into text');
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Speech to Text'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isRecording)
            const Text('Recording...')
          else if (_isTranscribing)
            const Text('Transcribing...')
          else
            const Text('Press the button to start recording.'),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: const TextStyle(color: Colors.red),
            ),
          ],
          if (_transcription != null) ...[
            const SizedBox(height: 8),
            Text(_transcription!),
          ],
        ],
      ),
      actions: [
        if (!_isRecording && !_isTranscribing)
          ElevatedButton(
            onPressed: _startRecording,
            child: const Text('Start recording'),
          ),
        if (_isRecording)
          ElevatedButton(
            onPressed: () async {
              await _stopRecording();
              await _submit();
            },
            child: const Text('Stop recording and transcribe'),
          ),
        if (_isRecording)
          ElevatedButton(
            onPressed: _stopRecording,
            child: const Text('Stop recording'),
          ),
        if (!_isRecording && !_isTranscribing)
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
      ],
    );
  }
}
