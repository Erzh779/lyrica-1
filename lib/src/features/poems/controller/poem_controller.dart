import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:poem/src/features/poems/model/poem.dart';

final class PoemController extends StateController<PoemState>
    with SequentialControllerHandler {
  PoemController({
    required IPoemsRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IPoemsRepository _repository;

  /// Delete a poem.
  void deletePoem(Poem poem) => handle(
        name: 'DeletePoem',
        () async {
          setState(
            PoemState.processing(
              poem: state.poem,
              message: 'Deleting poem...',
            ),
          );

          await _repository.deletePoem(poem);

          setState(
            PoemState.deleted(
              poem: state.poem,
              message: 'Poem deleted successfully!',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          PoemState.failed(
            poem: state.poem,
            message: 'Failed to delete poem: $error',
          ),
        ),
        done: () async => setState(
          PoemState.idle(
            poem: state.poem,
          ),
        ),
      );
}

/// {@template poem_state}
/// PoemState.
/// {@endtemplate}
sealed class PoemState extends _$PoemStateBase {
  /// {@macro poem_state}
  const PoemState({required super.poem, required super.message});

  /// Idle
  /// {@macro poem_state}
  const factory PoemState.idle({
    required Poem poem,
    String message,
  }) = PoemState$Idle;

  /// Processing
  /// {@macro poem_state}
  const factory PoemState.processing({
    required Poem poem,
    String message,
  }) = PoemState$Processing;

  /// Succeeded
  /// {@macro poem_state}
  const factory PoemState.succeeded({
    required Poem poem,
    String message,
  }) = PoemState$Succeeded;

  /// Failed
  /// {@macro poem_state}
  const factory PoemState.failed({
    required Poem poem,
    String message,
  }) = PoemState$Failed;

  /// Deleted
  /// {@macro poem_state}
  const factory PoemState.deleted({
    required Poem poem,
    String message,
  }) = PoemState$Deleted;

  /// Initial
  /// {@macro poem_state}
  factory PoemState.initial({
    required Poem poem,
    String? message,
  }) =>
      PoemState$Idle(
        poem: poem,
        message: message ?? 'Initial',
      );
}

/// Idle
final class PoemState$Idle extends PoemState {
  const PoemState$Idle({required super.poem, super.message = 'Idle'});

  @override
  String get type => 'idle';
}

/// Processing
final class PoemState$Processing extends PoemState {
  const PoemState$Processing(
      {required super.poem, super.message = 'Processing'});

  @override
  String get type => 'processing';
}

/// Succeeded
final class PoemState$Succeeded extends PoemState {
  const PoemState$Succeeded({required super.poem, super.message = 'Succeeded'});

  @override
  String get type => 'succeeded';
}

/// Failed
final class PoemState$Failed extends PoemState {
  const PoemState$Failed({required super.poem, super.message = 'Failed'});

  @override
  String get type => 'failed';
}

/// Deleted
final class PoemState$Deleted extends PoemState {
  const PoemState$Deleted({required super.poem, super.message = 'Deleted'});

  @override
  String get type => 'deleted';
}

/// Pattern matching for [PoemState].
typedef PoemStateMatch<R, S extends PoemState> = R Function(S element);

@immutable
abstract base class _$PoemStateBase {
  const _$PoemStateBase({required this.poem, required this.message});

  /// Type alias for [PoemState].
  abstract final String type;

  /// poem entity payload.
  @nonVirtual
  final Poem poem;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is PoemState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is PoemState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is PoemState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is PoemState$Failed;

  /// Check if is Deleted.
  bool get isDeleted => this is PoemState$Deleted;

  /// Pattern matching for [PoemState].
  R map<R>({
    required PoemStateMatch<R, PoemState$Idle> idle,
    required PoemStateMatch<R, PoemState$Processing> processing,
    required PoemStateMatch<R, PoemState$Succeeded> succeeded,
    required PoemStateMatch<R, PoemState$Failed> failed,
    required PoemStateMatch<R, PoemState$Deleted> deleted,
  }) =>
      switch (this) {
        PoemState$Idle s => idle(s),
        PoemState$Processing s => processing(s),
        PoemState$Succeeded s => succeeded(s),
        PoemState$Failed s => failed(s),
        PoemState$Deleted s => deleted(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [PoemState].
  R maybeMap<R>({
    required R Function() orElse,
    PoemStateMatch<R, PoemState$Idle>? idle,
    PoemStateMatch<R, PoemState$Processing>? processing,
    PoemStateMatch<R, PoemState$Succeeded>? succeeded,
    PoemStateMatch<R, PoemState$Failed>? failed,
    PoemStateMatch<R, PoemState$Deleted>? deleted,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
        deleted: deleted ?? (_) => orElse(),
      );

  /// Pattern matching for [PoemState].
  R? mapOrNull<R>({
    PoemStateMatch<R, PoemState$Idle>? idle,
    PoemStateMatch<R, PoemState$Processing>? processing,
    PoemStateMatch<R, PoemState$Succeeded>? succeeded,
    PoemStateMatch<R, PoemState$Failed>? failed,
    PoemStateMatch<R, PoemState$Deleted>? deleted,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
        deleted: deleted ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, poem);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _$PoemStateBase &&
          type == other.type &&
          identical(poem, other.poem));

  @override
  String toString() => 'PoemState.$type{message: $message}';
}
