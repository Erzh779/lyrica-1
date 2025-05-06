// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function(String email) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function(String email)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpState$Idle value) idle,
    required TResult Function(SignUpState$Processing value) processing,
    required TResult Function(SignUpState$Successful value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpState$Idle value)? idle,
    TResult? Function(SignUpState$Processing value)? processing,
    TResult? Function(SignUpState$Successful value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpState$Idle value)? idle,
    TResult Function(SignUpState$Processing value)? processing,
    TResult Function(SignUpState$Successful value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignUpState$IdleImplCopyWith<$Res> {
  factory _$$SignUpState$IdleImplCopyWith(_$SignUpState$IdleImpl value,
          $Res Function(_$SignUpState$IdleImpl) then) =
      __$$SignUpState$IdleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SignUpState$IdleImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpState$IdleImpl>
    implements _$$SignUpState$IdleImplCopyWith<$Res> {
  __$$SignUpState$IdleImplCopyWithImpl(_$SignUpState$IdleImpl _value,
      $Res Function(_$SignUpState$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SignUpState$IdleImpl(
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SignUpState$IdleImpl extends SignUpState$Idle {
  const _$SignUpState$IdleImpl({required this.error}) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'SignUpState.idle(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpState$IdleImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpState$IdleImplCopyWith<_$SignUpState$IdleImpl> get copyWith =>
      __$$SignUpState$IdleImplCopyWithImpl<_$SignUpState$IdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function(String email) successful,
  }) {
    return idle(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function(String email)? successful,
  }) {
    return idle?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpState$Idle value) idle,
    required TResult Function(SignUpState$Processing value) processing,
    required TResult Function(SignUpState$Successful value) successful,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpState$Idle value)? idle,
    TResult? Function(SignUpState$Processing value)? processing,
    TResult? Function(SignUpState$Successful value)? successful,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpState$Idle value)? idle,
    TResult Function(SignUpState$Processing value)? processing,
    TResult Function(SignUpState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class SignUpState$Idle extends SignUpState {
  const factory SignUpState$Idle({required final Object? error}) =
      _$SignUpState$IdleImpl;
  const SignUpState$Idle._() : super._();

  Object? get error;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpState$IdleImplCopyWith<_$SignUpState$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpState$ProcessingImplCopyWith<$Res> {
  factory _$$SignUpState$ProcessingImplCopyWith(
          _$SignUpState$ProcessingImpl value,
          $Res Function(_$SignUpState$ProcessingImpl) then) =
      __$$SignUpState$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpState$ProcessingImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpState$ProcessingImpl>
    implements _$$SignUpState$ProcessingImplCopyWith<$Res> {
  __$$SignUpState$ProcessingImplCopyWithImpl(
      _$SignUpState$ProcessingImpl _value,
      $Res Function(_$SignUpState$ProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpState$ProcessingImpl extends SignUpState$Processing {
  const _$SignUpState$ProcessingImpl() : super._();

  @override
  String toString() {
    return 'SignUpState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpState$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function(String email) successful,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function(String email)? successful,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpState$Idle value) idle,
    required TResult Function(SignUpState$Processing value) processing,
    required TResult Function(SignUpState$Successful value) successful,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpState$Idle value)? idle,
    TResult? Function(SignUpState$Processing value)? processing,
    TResult? Function(SignUpState$Successful value)? successful,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpState$Idle value)? idle,
    TResult Function(SignUpState$Processing value)? processing,
    TResult Function(SignUpState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class SignUpState$Processing extends SignUpState {
  const factory SignUpState$Processing() = _$SignUpState$ProcessingImpl;
  const SignUpState$Processing._() : super._();
}

/// @nodoc
abstract class _$$SignUpState$SuccessfulImplCopyWith<$Res> {
  factory _$$SignUpState$SuccessfulImplCopyWith(
          _$SignUpState$SuccessfulImpl value,
          $Res Function(_$SignUpState$SuccessfulImpl) then) =
      __$$SignUpState$SuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignUpState$SuccessfulImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpState$SuccessfulImpl>
    implements _$$SignUpState$SuccessfulImplCopyWith<$Res> {
  __$$SignUpState$SuccessfulImplCopyWithImpl(
      _$SignUpState$SuccessfulImpl _value,
      $Res Function(_$SignUpState$SuccessfulImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignUpState$SuccessfulImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpState$SuccessfulImpl extends SignUpState$Successful {
  const _$SignUpState$SuccessfulImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpState.successful(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpState$SuccessfulImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpState$SuccessfulImplCopyWith<_$SignUpState$SuccessfulImpl>
      get copyWith => __$$SignUpState$SuccessfulImplCopyWithImpl<
          _$SignUpState$SuccessfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function(String email) successful,
  }) {
    return successful(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function(String email)? successful,
  }) {
    return successful?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpState$Idle value) idle,
    required TResult Function(SignUpState$Processing value) processing,
    required TResult Function(SignUpState$Successful value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpState$Idle value)? idle,
    TResult? Function(SignUpState$Processing value)? processing,
    TResult? Function(SignUpState$Successful value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpState$Idle value)? idle,
    TResult Function(SignUpState$Processing value)? processing,
    TResult Function(SignUpState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class SignUpState$Successful extends SignUpState {
  const factory SignUpState$Successful({required final String email}) =
      _$SignUpState$SuccessfulImpl;
  const SignUpState$Successful._() : super._();

  String get email;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpState$SuccessfulImplCopyWith<_$SignUpState$SuccessfulImpl>
      get copyWith => throw _privateConstructorUsedError;
}
