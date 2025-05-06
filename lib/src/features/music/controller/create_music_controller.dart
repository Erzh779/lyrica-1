import 'dart:io';

import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/features/music/data/music_repository.dart';
import 'package:poem/src/features/music/model/genre.dart';
import 'package:poem/src/features/music/model/music.dart';

/// {@template create_music_controller}
/// CreateMusicController.
/// {@endtemplate}
final class CreateMusicController extends StateController<CreateMusicState>
    with SequentialControllerHandler {
  /// {@macro create_music_controller}
  CreateMusicController({
    required IMusicRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IMusicRepository _repository;

  /// Create music.
  void createMusic({
    required String title,
    required Genre genre,
    required File file,
  }) =>
      handle(
        name: 'CreateMusic',
        () async {
          setState(
            CreateMusicState.processing(
              progress: 0.0,
              message: 'Creating music...',
            ),
          );

          final music = await _repository.createMusic(
            title: title,
            genre: genre,
            file: file,
          );

          setState(
            CreateMusicState.succeeded(
              music: music,
              message: 'Music created successfully!',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          CreateMusicState.failed(
            message: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          CreateMusicState.idle(),
        ),
      );
}

/// {@template create_music_state}
/// CreateMusicState.
/// {@endtemplate}
sealed class CreateMusicState extends _$CreateMusicStateBase {
  /// {@macro create_music_state}
  const CreateMusicState({
    required super.message,
    super.music,
  });

  /// Idle
  /// {@macro create_music_state}
  const factory CreateMusicState.idle({
    String message,
  }) = CreateMusicState$Idle;

  /// Processing
  /// {@macro create_music_state}
  const factory CreateMusicState.processing({
    required double progress,
    String message,
  }) = CreateMusicState$Processing;

  /// Succeeded
  /// {@macro create_music_state}
  const factory CreateMusicState.succeeded({
    required Music music,
    String message,
  }) = CreateMusicState$Succeeded;

  /// Failed
  /// {@macro create_music_state}
  const factory CreateMusicState.failed({
    String message,
  }) = CreateMusicState$Failed;

  /// Initial
  /// {@macro create_music_state}
  factory CreateMusicState.initial({
    String? message,
  }) =>
      CreateMusicState$Idle(
        message: message ?? 'Initial',
      );
}

/// Idle
final class CreateMusicState$Idle extends CreateMusicState {
  /// Idle state.
  const CreateMusicState$Idle({
    super.message = 'Idle',
  });

  @override
  String get type => 'idle';
}

/// Processing
final class CreateMusicState$Processing extends CreateMusicState {
  /// Processing state.
  const CreateMusicState$Processing({
    required this.progress,
    super.message = 'Processing',
  });

  /// Progress of the uploading.
  final double progress;

  @override
  String get type => 'processing';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreateMusicState$Processing &&
          type == other.type &&
          progress == other.progress);

  @override
  int get hashCode => Object.hash(type, progress);
}

/// Succeeded
final class CreateMusicState$Succeeded extends CreateMusicState {
  /// Succeeded state.
  const CreateMusicState$Succeeded({
    super.music,
    super.message = 'Succeeded',
  });

  @override
  String get type => 'succeeded';
}

/// Failed
final class CreateMusicState$Failed extends CreateMusicState {
  /// Failed state.
  const CreateMusicState$Failed({
    super.music,
    super.message = 'Failed',
  });

  @override
  String get type => 'failed';
}

/// Pattern matching for [CreateMusicState].
typedef CreateMusicStateMatch<R, S extends CreateMusicState> = R Function(
    S element);

@immutable
abstract base class _$CreateMusicStateBase {
  const _$CreateMusicStateBase({required this.music, required this.message});

  /// Type alias for [CreateMusicState].
  abstract final String type;

  /// music entity payload.
  @nonVirtual
  final Music? music;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Has music?
  bool get hasmusic => music != null;

  /// Check if is Idle.
  bool get isIdle => this is CreateMusicState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is CreateMusicState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is CreateMusicState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is CreateMusicState$Failed;

  /// Pattern matching for [CreateMusicState].
  R map<R>({
    required CreateMusicStateMatch<R, CreateMusicState$Idle> idle,
    required CreateMusicStateMatch<R, CreateMusicState$Processing> processing,
    required CreateMusicStateMatch<R, CreateMusicState$Succeeded> succeeded,
    required CreateMusicStateMatch<R, CreateMusicState$Failed> failed,
  }) =>
      switch (this) {
        CreateMusicState$Idle s => idle(s),
        CreateMusicState$Processing s => processing(s),
        CreateMusicState$Succeeded s => succeeded(s),
        CreateMusicState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CreateMusicState].
  R maybeMap<R>({
    required R Function() orElse,
    CreateMusicStateMatch<R, CreateMusicState$Idle>? idle,
    CreateMusicStateMatch<R, CreateMusicState$Processing>? processing,
    CreateMusicStateMatch<R, CreateMusicState$Succeeded>? succeeded,
    CreateMusicStateMatch<R, CreateMusicState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [CreateMusicState].
  R? mapOrNull<R>({
    CreateMusicStateMatch<R, CreateMusicState$Idle>? idle,
    CreateMusicStateMatch<R, CreateMusicState$Processing>? processing,
    CreateMusicStateMatch<R, CreateMusicState$Succeeded>? succeeded,
    CreateMusicStateMatch<R, CreateMusicState$Failed>? failed,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, music);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _$CreateMusicStateBase &&
          type == other.type &&
          identical(music, other.music));

  @override
  String toString() => 'CreateMusicState.$type{message: $message}';
}
