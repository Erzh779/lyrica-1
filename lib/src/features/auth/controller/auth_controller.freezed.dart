// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  User get user => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String message, String? error) idle,
    required TResult Function(User user, String message) processing,
    required TResult Function(User user, String message) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String message, String? error)? idle,
    TResult? Function(User user, String message)? processing,
    TResult? Function(User user, String message)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String message, String? error)? idle,
    TResult Function(User user, String message)? processing,
    TResult Function(User user, String message)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateIdle value) idle,
    required TResult Function(AuthStateProcessing value) processing,
    required TResult Function(AuthStateSuccessful value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateIdle value)? idle,
    TResult? Function(AuthStateProcessing value)? processing,
    TResult? Function(AuthStateSuccessful value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateIdle value)? idle,
    TResult Function(AuthStateProcessing value)? processing,
    TResult Function(AuthStateSuccessful value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({User user, String message});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateIdleImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateIdleImplCopyWith(
          _$AuthStateIdleImpl value, $Res Function(_$AuthStateIdleImpl) then) =
      __$$AuthStateIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, String message, String? error});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateIdleImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateIdleImpl>
    implements _$$AuthStateIdleImplCopyWith<$Res> {
  __$$AuthStateIdleImplCopyWithImpl(
      _$AuthStateIdleImpl _value, $Res Function(_$AuthStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
    Object? error = freezed,
  }) {
    return _then(_$AuthStateIdleImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateIdleImpl extends AuthStateIdle {
  const _$AuthStateIdleImpl(
      {required this.user, this.message = 'Idle', this.error})
      : super._();

  @override
  final User user;
  @override
  @JsonKey()
  final String message;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.idle(user: $user, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateIdleImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateIdleImplCopyWith<_$AuthStateIdleImpl> get copyWith =>
      __$$AuthStateIdleImplCopyWithImpl<_$AuthStateIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String message, String? error) idle,
    required TResult Function(User user, String message) processing,
    required TResult Function(User user, String message) successful,
  }) {
    return idle(user, message, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String message, String? error)? idle,
    TResult? Function(User user, String message)? processing,
    TResult? Function(User user, String message)? successful,
  }) {
    return idle?.call(user, message, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String message, String? error)? idle,
    TResult Function(User user, String message)? processing,
    TResult Function(User user, String message)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(user, message, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateIdle value) idle,
    required TResult Function(AuthStateProcessing value) processing,
    required TResult Function(AuthStateSuccessful value) successful,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateIdle value)? idle,
    TResult? Function(AuthStateProcessing value)? processing,
    TResult? Function(AuthStateSuccessful value)? successful,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateIdle value)? idle,
    TResult Function(AuthStateProcessing value)? processing,
    TResult Function(AuthStateSuccessful value)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AuthStateIdle extends AuthState {
  const factory AuthStateIdle(
      {required final User user,
      final String message,
      final String? error}) = _$AuthStateIdleImpl;
  const AuthStateIdle._() : super._();

  @override
  User get user;
  @override
  String get message;
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateIdleImplCopyWith<_$AuthStateIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateProcessingImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateProcessingImplCopyWith(_$AuthStateProcessingImpl value,
          $Res Function(_$AuthStateProcessingImpl) then) =
      __$$AuthStateProcessingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, String message});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateProcessingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateProcessingImpl>
    implements _$$AuthStateProcessingImplCopyWith<$Res> {
  __$$AuthStateProcessingImplCopyWithImpl(_$AuthStateProcessingImpl _value,
      $Res Function(_$AuthStateProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_$AuthStateProcessingImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateProcessingImpl extends AuthStateProcessing {
  const _$AuthStateProcessingImpl(
      {required this.user, this.message = 'Processing'})
      : super._();

  @override
  final User user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthState.processing(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateProcessingImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateProcessingImplCopyWith<_$AuthStateProcessingImpl> get copyWith =>
      __$$AuthStateProcessingImplCopyWithImpl<_$AuthStateProcessingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String message, String? error) idle,
    required TResult Function(User user, String message) processing,
    required TResult Function(User user, String message) successful,
  }) {
    return processing(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String message, String? error)? idle,
    TResult? Function(User user, String message)? processing,
    TResult? Function(User user, String message)? successful,
  }) {
    return processing?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String message, String? error)? idle,
    TResult Function(User user, String message)? processing,
    TResult Function(User user, String message)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateIdle value) idle,
    required TResult Function(AuthStateProcessing value) processing,
    required TResult Function(AuthStateSuccessful value) successful,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateIdle value)? idle,
    TResult? Function(AuthStateProcessing value)? processing,
    TResult? Function(AuthStateSuccessful value)? successful,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateIdle value)? idle,
    TResult Function(AuthStateProcessing value)? processing,
    TResult Function(AuthStateSuccessful value)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class AuthStateProcessing extends AuthState {
  const factory AuthStateProcessing(
      {required final User user,
      final String message}) = _$AuthStateProcessingImpl;
  const AuthStateProcessing._() : super._();

  @override
  User get user;
  @override
  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateProcessingImplCopyWith<_$AuthStateProcessingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateSuccessfulImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateSuccessfulImplCopyWith(_$AuthStateSuccessfulImpl value,
          $Res Function(_$AuthStateSuccessfulImpl) then) =
      __$$AuthStateSuccessfulImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, String message});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateSuccessfulImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSuccessfulImpl>
    implements _$$AuthStateSuccessfulImplCopyWith<$Res> {
  __$$AuthStateSuccessfulImplCopyWithImpl(_$AuthStateSuccessfulImpl _value,
      $Res Function(_$AuthStateSuccessfulImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_$AuthStateSuccessfulImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateSuccessfulImpl extends AuthStateSuccessful {
  const _$AuthStateSuccessfulImpl(
      {required this.user, this.message = 'Successful'})
      : super._();

  @override
  final User user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthState.successful(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateSuccessfulImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateSuccessfulImplCopyWith<_$AuthStateSuccessfulImpl> get copyWith =>
      __$$AuthStateSuccessfulImplCopyWithImpl<_$AuthStateSuccessfulImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String message, String? error) idle,
    required TResult Function(User user, String message) processing,
    required TResult Function(User user, String message) successful,
  }) {
    return successful(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String message, String? error)? idle,
    TResult? Function(User user, String message)? processing,
    TResult? Function(User user, String message)? successful,
  }) {
    return successful?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String message, String? error)? idle,
    TResult Function(User user, String message)? processing,
    TResult Function(User user, String message)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateIdle value) idle,
    required TResult Function(AuthStateProcessing value) processing,
    required TResult Function(AuthStateSuccessful value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateIdle value)? idle,
    TResult? Function(AuthStateProcessing value)? processing,
    TResult? Function(AuthStateSuccessful value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateIdle value)? idle,
    TResult Function(AuthStateProcessing value)? processing,
    TResult Function(AuthStateSuccessful value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class AuthStateSuccessful extends AuthState {
  const factory AuthStateSuccessful(
      {required final User user,
      final String message}) = _$AuthStateSuccessfulImpl;
  const AuthStateSuccessful._() : super._();

  @override
  User get user;
  @override
  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateSuccessfulImplCopyWith<_$AuthStateSuccessfulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
