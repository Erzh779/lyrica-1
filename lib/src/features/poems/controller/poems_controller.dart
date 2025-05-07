import 'package:control/control.dart';
import 'package:meta/meta.dart';
import 'package:poem/src/core/utils/error_util.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:poem/src/features/poems/model/poem.dart';

/// {@template poems_controller}
/// A controller class responsible for managing the state of poems and handling
/// operations related to querying poems from a repository.
///
/// This class extends [StateController] with a state of type [PoemsState] and
/// uses the [SequentialControllerHandler] mixin to handle sequential operations.
///
/// The [PoemsController] interacts with an [IPoemsRepository] to fetch poems
/// and updates the state accordingly.
///
/// {@endtemplate}
///
/// Constructor:

final class PoemsController extends StateController<PoemsState> with SequentialControllerHandler {
  /// {@macro poems_controller}
  ///
  /// - [PoemsController]: Requires an [IPoemsRepository] instance and an initial
  ///   state of type [PoemsState].
  PoemsController({
    required IPoemsRepository repository,
    required super.initialState,
  }) : _repository = repository;

  final IPoemsRepository _repository;

  /// Adds a new poem to the state
  void addPoem(Poem poem) => handle(
        name: 'AddPoem',
        () async {
          setState(
            PoemsState.processing(
              poems: state.poems,
              message: 'Adding poem...',
            ),
          );

          final poems = [poem, ...state.poems];

          setState(
            PoemsState.succeeded(
              poems: poems,
              message: 'Poem added successfully! Count: ${poems.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          PoemsState.failed(
            poems: state.poems,
            message: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          PoemsState.idle(
            poems: state.poems,
          ),
        ),
      );

  /// Initiates a query operation to fetch poems from the repository.
  void query() => handle(
        name: 'Query',
        () async {
          setState(
            PoemsState.processing(
              poems: state.poems,
              message: 'Querying poems...',
            ),
          );

          final poems = await _repository.queryPoems();

          setState(
            PoemsState.succeeded(
              poems: poems,
              message: 'Poems queried successfully! Count: ${poems.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          PoemsState.failed(
            poems: state.poems,
            message: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          PoemsState.idle(
            poems: state.poems,
          ),
        ),
      );

  /// Delete a poem.
  void deletePoem(Poem poem) => handle(
        name: 'DeletePoem',
        () async {
          setState(
            PoemsState.processing(
              poems: state.poems,
              message: 'Deleting poem...',
            ),
          );

          final poems = state.poems.where((p) => p.id != poem.id).toList();

          setState(
            PoemsState.succeeded(
              poems: poems,
              message: 'Poem deleted successfully! Count: ${poems.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          PoemsState.failed(
            poems: state.poems,
            message: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          PoemsState.idle(
            poems: state.poems,
          ),
        ),
      );

  /// Update a poem.
  void updatePoem(Poem poem) => handle(
        name: 'UpdatePoem',
        () async {
          setState(
            PoemsState.processing(
              poems: state.poems,
              message: 'Updating poem...',
            ),
          );

          final poems = state.poems.map((p) => p.id == poem.id ? poem : p).toList();

          setState(
            PoemsState.succeeded(
              poems: poems,
              message: 'Poem updated successfully! Count: ${poems.length}',
            ),
          );
        },
        error: (error, stackTrace) async => setState(
          PoemsState.failed(
            poems: state.poems,
            message: ErrorUtil.formatMessage(
              error,
            ),
          ),
        ),
        done: () async => setState(
          PoemsState.idle(
            poems: state.poems,
          ),
        ),
      );
}

/// {@template poems_state}
/// PoemsState.
/// {@endtemplate}
sealed class PoemsState extends _$PoemsStateBase {
  /// {@macro poems_state}
  const PoemsState({
    required super.poems,
    required super.message,
  });

  /// Idle
  /// {@macro poems_state}
  const factory PoemsState.idle({
    required List<Poem> poems,
    String message,
  }) = PoemsState$Idle;

  /// Processing
  /// {@macro poems_state}
  const factory PoemsState.processing({
    required List<Poem> poems,
    String message,
  }) = PoemsState$Processing;

  /// Succeeded
  /// {@macro poems_state}
  const factory PoemsState.succeeded({
    required List<Poem> poems,
    String message,
  }) = PoemsState$Succeeded;

  /// Failed
  /// {@macro poems_state}
  const factory PoemsState.failed({
    required List<Poem> poems,
    String message,
  }) = PoemsState$Failed;

  /// Initial
  /// {@macro poems_state}
  factory PoemsState.initial({
    required List<Poem> poems,
    String? message,
  }) =>
      PoemsState$Idle(
        poems: poems,
        message: message ?? 'Initial',
      );
}

/// Idle
final class PoemsState$Idle extends PoemsState {
  /// Idle state.
  const PoemsState$Idle({
    required super.poems,
    super.message = 'Idle',
  });

  @override
  String get type => 'idle';
}

/// Processing
final class PoemsState$Processing extends PoemsState {
  /// Processing state.
  const PoemsState$Processing({
    required super.poems,
    super.message = 'Processing',
  });

  @override
  String get type => 'processing';
}

/// Succeeded
final class PoemsState$Succeeded extends PoemsState {
  /// Succeeded state.
  const PoemsState$Succeeded({
    required super.poems,
    super.message = 'Succeeded',
  });

  @override
  String get type => 'succeeded';
}

/// Failed
final class PoemsState$Failed extends PoemsState {
  /// Failed state.
  const PoemsState$Failed({
    required super.poems,
    super.message = 'Failed',
  });

  @override
  String get type => 'failed';
}

/// Pattern matching for [PoemsState].
typedef PoemsStateMatch<R, S extends PoemsState> = R Function(S element);

@immutable
abstract base class _$PoemsStateBase {
  const _$PoemsStateBase({required this.poems, required this.message});

  /// Type alias for [PoemsState].
  abstract final String type;

  /// poems entity payload.
  @nonVirtual
  final List<Poem> poems;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is PoemsState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is PoemsState$Processing;

  /// Check if is Succeeded.
  bool get isSucceeded => this is PoemsState$Succeeded;

  /// Check if is Failed.
  bool get isFailed => this is PoemsState$Failed;

  /// Pattern matching for [PoemsState].
  R map<R>({
    required PoemsStateMatch<R, PoemsState$Idle> idle,
    required PoemsStateMatch<R, PoemsState$Processing> processing,
    required PoemsStateMatch<R, PoemsState$Succeeded> succeeded,
    required PoemsStateMatch<R, PoemsState$Failed> failed,
  }) =>
      switch (this) {
        PoemsState$Idle s => idle(s),
        PoemsState$Processing s => processing(s),
        PoemsState$Succeeded s => succeeded(s),
        PoemsState$Failed s => failed(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [PoemsState].
  R maybeMap<R>({
    required R Function() orElse,
    PoemsStateMatch<R, PoemsState$Idle>? idle,
    PoemsStateMatch<R, PoemsState$Processing>? processing,
    PoemsStateMatch<R, PoemsState$Succeeded>? succeeded,
    PoemsStateMatch<R, PoemsState$Failed>? failed,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        succeeded: succeeded ?? (_) => orElse(),
        failed: failed ?? (_) => orElse(),
      );

  /// Pattern matching for [PoemsState].
  R? mapOrNull<R>({
    PoemsStateMatch<R, PoemsState$Idle>? idle,
    PoemsStateMatch<R, PoemsState$Processing>? processing,
    PoemsStateMatch<R, PoemsState$Succeeded>? succeeded,
    PoemsStateMatch<R, PoemsState$Failed>? failed,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        succeeded: succeeded ?? (_) => null,
        failed: failed ?? (_) => null,
      );

  @override
  int get hashCode => Object.hash(type, poems);

  @override
  bool operator ==(Object other) => identical(this, other) || (other is _$PoemsStateBase && type == other.type && identical(poems, other.poems));

  @override
  String toString() => 'PoemsState.$type{message: $message}';
}
