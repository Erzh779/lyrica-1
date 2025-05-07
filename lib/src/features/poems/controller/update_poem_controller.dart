import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/model/poem_data.dart';

final class UpdatePoemController extends StateController<UpdatePoemState> with SequentialControllerHandler {
  UpdatePoemController({
    required IPoemsRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IPoemsRepository _repository;

  /// Update a poem.
  void updatePoem({
    required PoemData data,
  }) =>
      handle(
        name: 'UpdatePoem',
        () async {
          setState(
            UpdatePoemState.processing(
              poem: state.poem,
              message: 'Updating poem...',
            ),
          );

          final poem = await _repository.updatePoem(state.poem, data);

          setState(
            UpdatePoemState.succeeded(
              poem: poem,
              message: 'Poem updated successfully!',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          UpdatePoemState.failed(
            poem: state.poem,
            message: 'Failed to update poem: $error',
          ),
        ),
        done: () async => setState(
          UpdatePoemState.idle(
            poem: state.poem,
            message: 'Poem updated successfully!',
          ),
        ),
      );
}

/// {@template update_poem_state}
/// UpdatePoemState.
/// {@endtemplate}
sealed class UpdatePoemState extends _$UpdatePoemStateBase {
  /// {@macro update_poem_state}
  const UpdatePoemState({required super.poem, required super.message});

  /// Idle
  /// {@macro update_poem_state}
  const factory UpdatePoemState.idle({
    required Poem poem,
    String message,
  }) = UpdatePoemState$Idle;

  /// Processing
  /// {@macro update_poem_state}
  const factory UpdatePoemState.processing({
    required Poem poem,
    String message,
  }) = UpdatePoemState$Processing;

  /// Succeeded
  /// {@macro update_poem_state}
  const factory UpdatePoemState.succeeded({
    required Poem poem,
    String message,
  }) = UpdatePoemState$Succeeded;

  /// Failed
  /// {@macro update_poem_state}
  const factory UpdatePoemState.failed({
    required Poem poem,
    String message,
  }) = UpdatePoemState$Failed;

  /// Initial
  /// {@macro update_poem_state}
  factory UpdatePoemState.initial({
    required Poem poem,
    String? message,
  }) =>
      UpdatePoemState$Idle(
        poem: poem,
        message: message ?? 'Initial',
      );
}

/// Idle
final class UpdatePoemState$Idle extends UpdatePoemState {
  const UpdatePoemState$Idle({required super.poem, super.message = 'Idle'});

  @override
  String get type => 'idle';
}

/// Processing
final class UpdatePoemState$Processing extends UpdatePoemState {
  const UpdatePoemState$Processing({required super.poem, super.message = 'Processing'});

  @override
  String get type => 'processing';
}

/// Succeeded
final class UpdatePoemState$Succeeded extends UpdatePoemState {
  const UpdatePoemState$Succeeded({required super.poem, super.message = 'Succeeded'});

  @override
  String get type => 'succeeded';
}

/// Failed
final class UpdatePoemState$Failed extends UpdatePoemState {
  const UpdatePoemState$Failed({required super.poem, super.message = 'Failed'});

  @override
  String get type => 'failed';
}

/// Pattern matching for [UpdatePoemState].
typedef UpdatePoemStateMatch<R, S extends UpdatePoemState> = R Function(S element);

@immutable
abstract base class _$UpdatePoemStateBase {
  const _$UpdatePoemStateBase({required this.poem, required this.message});

  /// Type alias for [UpdatePoemState].
  abstract final String type;

  /// poem entity payload.
  @nonVirtual
  final Poem poem;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is UpdatePoemState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is UpdatePoemState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is UpdatePoemState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is UpdatePoemState$Failed;

  /// Pattern matching for [UpdatePoemState].
  R map<R>({
    required UpdatePoemStateMatch<R, UpdatePoemState$Idle> idle,
    required UpdatePoemStateMatch<R, UpdatePoemState$Processing> processing,
    required UpdatePoemStateMatch<R, UpdatePoemState$Succeeded> succeeded,
    required UpdatePoemStateMatch<R, UpdatePoemState$Failed> failed,
  }) =>
      switch (this) {
        UpdatePoemState$Idle s => idle(s),
        UpdatePoemState$Processing s => processing(s),
        UpdatePoemState$Succeeded s => succeeded(s),
        UpdatePoemState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [UpdatePoemState].
  R maybeMap<R>({
    required R Function() orElse,
    UpdatePoemStateMatch<R, UpdatePoemState$Idle>? idle,
    UpdatePoemStateMatch<R, UpdatePoemState$Processing>? processing,
    UpdatePoemStateMatch<R, UpdatePoemState$Succeeded>? succeeded,
    UpdatePoemStateMatch<R, UpdatePoemState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [UpdatePoemState].
  R? mapOrNull<R>({
    UpdatePoemStateMatch<R, UpdatePoemState$Idle>? idle,
    UpdatePoemStateMatch<R, UpdatePoemState$Processing>? processing,
    UpdatePoemStateMatch<R, UpdatePoemState$Succeeded>? succeeded,
    UpdatePoemStateMatch<R, UpdatePoemState$Failed>? failed,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, poem);

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _$UpdatePoemStateBase && type == other.type && identical(poem, other.poem));

  @override
  String toString() => 'UpdatePoemState.$type{message: $message}';
}
