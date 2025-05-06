import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/features/music/data/music_repository.dart';
import 'package:poem/src/features/music/model/genre.dart';

/// {@template genres_controller}
/// GenresController.
/// {@endtemplate}
final class GenresController extends StateController<GenresState>
    with SequentialControllerHandler {
  /// {@macro genres_controller}
  GenresController({
    required IMusicRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IMusicRepository _repository;

  /// Query genres.
  void query() => handle(
        name: 'Query',
        () async {
          setState(
            GenresState.processing(
              genres: state.genres,
              message: 'Querying genres...',
            ),
          );

          final genres = await _repository.queryGenres();

          setState(
            GenresState.succeeded(
              genres: genres,
              message: 'Genres queried successfully! Count: ${genres.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          GenresState.failed(
            genres: state.genres,
            message: error.toString(),
          ),
        ),
        done: () async => setState(
          GenresState.idle(genres: state.genres),
        ),
      );
}

/// {@template genres_state}
/// GenresState.
/// {@endtemplate}
sealed class GenresState extends _$GenresStateBase {
  /// {@macro genres_state}
  const GenresState({
    required super.genres,
    required super.message,
  });

  /// Idle
  /// {@macro genres_state}
  const factory GenresState.idle({
    required List<Genre> genres,
    String message,
  }) = GenresState$Idle;

  /// Processing
  /// {@macro genres_state}
  const factory GenresState.processing({
    required List<Genre> genres,
    String message,
  }) = GenresState$Processing;

  /// Succeeded
  /// {@macro genres_state}
  const factory GenresState.succeeded({
    required List<Genre> genres,
    String message,
  }) = GenresState$Succeeded;

  /// Failed
  /// {@macro genres_state}
  const factory GenresState.failed({
    required List<Genre> genres,
    String message,
  }) = GenresState$Failed;

  /// Initial
  /// {@macro genres_state}
  factory GenresState.initial({
    required List<Genre> genres,
    String? message,
  }) =>
      GenresState$Idle(
        genres: genres,
        message: message ?? 'Initial',
      );
}

/// Idle
final class GenresState$Idle extends GenresState {
  const GenresState$Idle({required super.genres, super.message = 'Idle'});

  @override
  String get type => 'idle';
}

/// Processing
final class GenresState$Processing extends GenresState {
  const GenresState$Processing(
      {required super.genres, super.message = 'Processing'});

  @override
  String get type => 'processing';
}

/// Succeeded
final class GenresState$Succeeded extends GenresState {
  const GenresState$Succeeded(
      {required super.genres, super.message = 'Succeeded'});

  @override
  String get type => 'succeeded';
}

/// Failed
final class GenresState$Failed extends GenresState {
  const GenresState$Failed({required super.genres, super.message = 'Failed'});

  @override
  String get type => 'failed';
}

/// Pattern matching for [GenresState].
typedef GenresStateMatch<R, S extends GenresState> = R Function(S element);

@immutable
abstract base class _$GenresStateBase {
  const _$GenresStateBase({required this.genres, required this.message});

  /// Type alias for [GenresState].
  abstract final String type;

  /// genres entity payload.
  @nonVirtual
  final List<Genre> genres;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is GenresState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is GenresState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is GenresState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is GenresState$Failed;

  /// Pattern matching for [GenresState].
  R map<R>({
    required GenresStateMatch<R, GenresState$Idle> idle,
    required GenresStateMatch<R, GenresState$Processing> processing,
    required GenresStateMatch<R, GenresState$Succeeded> succeeded,
    required GenresStateMatch<R, GenresState$Failed> failed,
  }) =>
      switch (this) {
        GenresState$Idle s => idle(s),
        GenresState$Processing s => processing(s),
        GenresState$Succeeded s => succeeded(s),
        GenresState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [GenresState].
  R maybeMap<R>({
    required R Function() orElse,
    GenresStateMatch<R, GenresState$Idle>? idle,
    GenresStateMatch<R, GenresState$Processing>? processing,
    GenresStateMatch<R, GenresState$Succeeded>? succeeded,
    GenresStateMatch<R, GenresState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [GenresState].
  R? mapOrNull<R>({
    GenresStateMatch<R, GenresState$Idle>? idle,
    GenresStateMatch<R, GenresState$Processing>? processing,
    GenresStateMatch<R, GenresState$Succeeded>? succeeded,
    GenresStateMatch<R, GenresState$Failed>? failed,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, genres);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _$GenresStateBase &&
          type == other.type &&
          identical(genres, other.genres));

  @override
  String toString() => 'GenresState.$type{message: $message}';
}
