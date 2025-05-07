import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:poem/src/features/poems/model/poem.dart';
import 'package:poem/src/features/poems/model/poem_data.dart';

/// {@template create_poem_controller}
/// A controller responsible for managing the state and behavior of creating a poem.
///
/// The [CreatePoemController] extends [StateController] with [CreatePoemState] and
/// utilizes [SequentialControllerHandler] to handle sequential operations.
///
/// This controller interacts with an [IPoemsRepository] to perform the poem creation
/// process and updates the state accordingly.
///
/// {@endtemplate}

final class CreatePoemController extends StateController<CreatePoemState> with SequentialControllerHandler {
  /// {@macro create_poem_controller}
  ///   - Requires an [IPoemsRepository] instance to handle poem-related operations.
  ///   - Requires an initial state of type [CreatePoemState].
  CreatePoemController({
    required IPoemsRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IPoemsRepository _repository;

  /// Accepts a [PoemData] object containing the data for the poem to be created.
  ///   - Handles the poem creation process by:
  ///     - Setting the state to `processing` with a message indicating the operation.
  ///     - Calling the repository's `createPoem` method to create the poem.
  ///     - Updating the state to `succeeded` with the created poem and a success message
  ///       if the operation is successful.
  ///     - Updating the state to `failed` with an error message if an error occurs.
  ///     - Resetting the state to `idle` once the operation is complete.
  void submit(
    PoemData data,
  ) =>
      handle(
        name: 'Submit',
        () async {
          setState(
            CreatePoemState.processing(
              message: 'Creating poem...',
            ),
          );

          final poem = await _repository.createPoem(
            data,
          );

          setState(
            CreatePoemState.succeeded(
              poem: poem,
              message: 'Poem created successfully!',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          CreatePoemState.failed(
            message: 'Failed to create poem: $error',
          ),
        ),
        done: () async => setState(
          CreatePoemState.idle(),
        ),
      );
}

/// {@template create_poem_state}
/// CreatePoemState.
/// {@endtemplate}
sealed class CreatePoemState extends _$CreatePoemStateBase {
  /// {@macro create_poem_state}
  const CreatePoemState({
    required super.message,
    super.poem,
  });

  /// Idle
  /// {@macro create_poem_state}
  const factory CreatePoemState.idle({
    String message,
  }) = CreatePoemState$Idle;

  /// Processing
  /// {@macro create_poem_state}
  const factory CreatePoemState.processing({
    String message,
  }) = CreatePoemState$Processing;

  /// Succeeded
  /// {@macro create_poem_state}
  const factory CreatePoemState.succeeded({
    required Poem poem,
    String message,
  }) = CreatePoemState$Succeeded;

  /// Failed
  /// {@macro create_poem_state}
  const factory CreatePoemState.failed({
    String message,
  }) = CreatePoemState$Failed;

  /// Initial
  /// {@macro create_poem_state}
  factory CreatePoemState.initial({
    Poem? poem,
    String? message,
  }) =>
      CreatePoemState$Idle(
        message: message ?? 'Initial',
      );
}

/// Idle
final class CreatePoemState$Idle extends CreatePoemState {
  /// Idle state.
  const CreatePoemState$Idle({
    super.message = 'Idle',
  });

  @override
  String get type => 'idle';
}

/// Processing
final class CreatePoemState$Processing extends CreatePoemState {
  /// Processing state.
  const CreatePoemState$Processing({
    super.message = 'Processing',
  });

  @override
  String get type => 'processing';
}

/// Succeeded
final class CreatePoemState$Succeeded extends CreatePoemState {
  /// Succeeded state.
  const CreatePoemState$Succeeded({
    required this.poem,
    super.message = 'Succeeded',
  });

  @override
  // ignore: invalid_override_of_non_virtual_member
  final Poem poem;

  @override
  String get type => 'succeeded';
}

/// Failed
final class CreatePoemState$Failed extends CreatePoemState {
  /// Failed state.
  const CreatePoemState$Failed({
    super.message = 'Failed',
  });

  @override
  String get type => 'failed';
}

/// Pattern matching for [CreatePoemState].
typedef CreatePoemStateMatch<R, S extends CreatePoemState> = R Function(S element);

@immutable
abstract base class _$CreatePoemStateBase {
  const _$CreatePoemStateBase({required this.poem, required this.message});

  /// Type alias for [CreatePoemState].
  abstract final String type;

  /// poem entity payload.
  @nonVirtual
  final Poem? poem;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Has poem?
  bool get haspoem => poem != null;

  /// Check if is Idle.
  bool get isIdle => this is CreatePoemState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is CreatePoemState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is CreatePoemState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is CreatePoemState$Failed;

  /// Pattern matching for [CreatePoemState].
  R map<R>({
    required CreatePoemStateMatch<R, CreatePoemState$Idle> idle,
    required CreatePoemStateMatch<R, CreatePoemState$Processing> processing,
    required CreatePoemStateMatch<R, CreatePoemState$Succeeded> succeeded,
    required CreatePoemStateMatch<R, CreatePoemState$Failed> failed,
  }) =>
      switch (this) {
        CreatePoemState$Idle s => idle(s),
        CreatePoemState$Processing s => processing(s),
        CreatePoemState$Succeeded s => succeeded(s),
        CreatePoemState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CreatePoemState].
  R maybeMap<R>({
    required R Function() orElse,
    CreatePoemStateMatch<R, CreatePoemState$Idle>? idle,
    CreatePoemStateMatch<R, CreatePoemState$Processing>? processing,
    CreatePoemStateMatch<R, CreatePoemState$Succeeded>? succeeded,
    CreatePoemStateMatch<R, CreatePoemState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [CreatePoemState].
  R? mapOrNull<R>({
    CreatePoemStateMatch<R, CreatePoemState$Idle>? idle,
    CreatePoemStateMatch<R, CreatePoemState$Processing>? processing,
    CreatePoemStateMatch<R, CreatePoemState$Succeeded>? succeeded,
    CreatePoemStateMatch<R, CreatePoemState$Failed>? failed,
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
  bool operator ==(Object other) => identical(this, other) || (other is _$CreatePoemStateBase && type == other.type && identical(poem, other.poem));

  @override
  String toString() => 'CreatePoemState.$type{message: $message}';
}
