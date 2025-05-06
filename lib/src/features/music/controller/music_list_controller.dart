import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/features/music/data/music_repository.dart';
import 'package:poem/src/features/music/model/music.dart';

/// {@template music_list_controller}
/// MusicListController.
/// {@endtemplate}
final class MusicListController extends StateController<MusicListState>
    with SequentialControllerHandler {
  /// {@macro music_list_controller}
  MusicListController({
    required IMusicRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IMusicRepository _repository;

  /// Add music to the list.
  void addMusic(Music music) => handle(
        name: 'AddMusic',
        () async {
          setState(
            MusicListState.processing(
              musicList: state.musicList,
              message: 'Adding music...',
            ),
          );

          final musicList = [music, ...state.musicList];

          setState(
            MusicListState.succeeded(
              musicList: musicList,
              message: 'Music added successfully! Count: ${musicList.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          MusicListState.failed(
            musicList: state.musicList,
            message: error.toString(),
          ),
        ),
        done: () async => setState(
          MusicListState.idle(
            musicList: state.musicList,
          ),
        ),
      );

  /// Query music list.
  void query() => handle(
        name: 'Query',
        () async {
          setState(
            MusicListState.processing(
              musicList: state.musicList,
              message: 'Querying music...',
            ),
          );

          final musicList = await _repository.queryMusics();

          setState(
            MusicListState.succeeded(
              musicList: musicList,
              message: 'Music queried successfully! Count: ${musicList.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          MusicListState.failed(
            musicList: state.musicList,
            message: error.toString(),
          ),
        ),
        done: () async => setState(
          MusicListState.idle(
            musicList: state.musicList,
          ),
        ),
      );
}

/// {@template music_list_state}
/// MusicListState.
/// {@endtemplate}
sealed class MusicListState extends _$MusicListStateBase {
  /// {@macro music_list_state}
  const MusicListState({
    required super.musicList,
    required super.message,
  });

  /// Idle
  /// {@macro music_list_state}
  const factory MusicListState.idle({
    required List<Music> musicList,
    String message,
  }) = MusicListState$Idle;

  /// Processing
  /// {@macro music_list_state}
  const factory MusicListState.processing({
    required List<Music> musicList,
    String message,
  }) = MusicListState$Processing;

  /// Succeeded
  /// {@macro music_list_state}
  const factory MusicListState.succeeded({
    required List<Music> musicList,
    String message,
  }) = MusicListState$Succeeded;

  /// Failed
  /// {@macro music_list_state}
  const factory MusicListState.failed({
    required List<Music> musicList,
    String message,
  }) = MusicListState$Failed;

  /// Initial
  /// {@macro music_list_state}
  factory MusicListState.initial({
    required List<Music> musicList,
    String? message,
  }) =>
      MusicListState$Idle(
        musicList: musicList,
        message: message ?? 'Initial',
      );
}

/// Idle
final class MusicListState$Idle extends MusicListState {
  const MusicListState$Idle({required super.musicList, super.message = 'Idle'});

  @override
  String get type => 'idle';
}

/// Processing
final class MusicListState$Processing extends MusicListState {
  const MusicListState$Processing(
      {required super.musicList, super.message = 'Processing'});

  @override
  String get type => 'processing';
}

/// Succeeded
final class MusicListState$Succeeded extends MusicListState {
  const MusicListState$Succeeded(
      {required super.musicList, super.message = 'Succeeded'});

  @override
  String get type => 'succeeded';
}

/// Failed
final class MusicListState$Failed extends MusicListState {
  const MusicListState$Failed(
      {required super.musicList, super.message = 'Failed'});

  @override
  String get type => 'failed';
}

/// Pattern matching for [MusicListState].
typedef MusicListStateMatch<R, S extends MusicListState> = R Function(
    S element);

@immutable
abstract base class _$MusicListStateBase {
  const _$MusicListStateBase({required this.musicList, required this.message});

  /// Type alias for [MusicListState].
  abstract final String type;

  /// musicList entity payload.
  @nonVirtual
  final List<Music> musicList;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is MusicListState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is MusicListState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is MusicListState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is MusicListState$Failed;

  /// Pattern matching for [MusicListState].
  R map<R>({
    required MusicListStateMatch<R, MusicListState$Idle> idle,
    required MusicListStateMatch<R, MusicListState$Processing> processing,
    required MusicListStateMatch<R, MusicListState$Succeeded> succeeded,
    required MusicListStateMatch<R, MusicListState$Failed> failed,
  }) =>
      switch (this) {
        MusicListState$Idle s => idle(s),
        MusicListState$Processing s => processing(s),
        MusicListState$Succeeded s => succeeded(s),
        MusicListState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [MusicListState].
  R maybeMap<R>({
    required R Function() orElse,
    MusicListStateMatch<R, MusicListState$Idle>? idle,
    MusicListStateMatch<R, MusicListState$Processing>? processing,
    MusicListStateMatch<R, MusicListState$Succeeded>? succeeded,
    MusicListStateMatch<R, MusicListState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [MusicListState].
  R? mapOrNull<R>({
    MusicListStateMatch<R, MusicListState$Idle>? idle,
    MusicListStateMatch<R, MusicListState$Processing>? processing,
    MusicListStateMatch<R, MusicListState$Succeeded>? succeeded,
    MusicListStateMatch<R, MusicListState$Failed>? failed,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, musicList);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _$MusicListStateBase &&
          type == other.type &&
          identical(musicList, other.musicList));

  @override
  String toString() => 'MusicListState.$type{message: $message}';
}
