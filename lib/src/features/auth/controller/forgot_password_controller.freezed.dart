// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function() successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function()? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function()? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordState$Idle value) idle,
    required TResult Function(ForgotPasswordState$Processing value) processing,
    required TResult Function(ForgotPasswordState$Successful value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordState$Idle value)? idle,
    TResult? Function(ForgotPasswordState$Processing value)? processing,
    TResult? Function(ForgotPasswordState$Successful value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordState$Idle value)? idle,
    TResult Function(ForgotPasswordState$Processing value)? processing,
    TResult Function(ForgotPasswordState$Successful value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ForgotPasswordState$IdleImplCopyWith<$Res> {
  factory _$$ForgotPasswordState$IdleImplCopyWith(
          _$ForgotPasswordState$IdleImpl value,
          $Res Function(_$ForgotPasswordState$IdleImpl) then) =
      __$$ForgotPasswordState$IdleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$ForgotPasswordState$IdleImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordState$IdleImpl>
    implements _$$ForgotPasswordState$IdleImplCopyWith<$Res> {
  __$$ForgotPasswordState$IdleImplCopyWithImpl(
      _$ForgotPasswordState$IdleImpl _value,
      $Res Function(_$ForgotPasswordState$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ForgotPasswordState$IdleImpl(
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordState$IdleImpl extends ForgotPasswordState$Idle {
  const _$ForgotPasswordState$IdleImpl({required this.error}) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'ForgotPasswordState.idle(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordState$IdleImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordState$IdleImplCopyWith<_$ForgotPasswordState$IdleImpl>
      get copyWith => __$$ForgotPasswordState$IdleImplCopyWithImpl<
          _$ForgotPasswordState$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function() successful,
  }) {
    return idle(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function()? successful,
  }) {
    return idle?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function()? successful,
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
    required TResult Function(ForgotPasswordState$Idle value) idle,
    required TResult Function(ForgotPasswordState$Processing value) processing,
    required TResult Function(ForgotPasswordState$Successful value) successful,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordState$Idle value)? idle,
    TResult? Function(ForgotPasswordState$Processing value)? processing,
    TResult? Function(ForgotPasswordState$Successful value)? successful,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordState$Idle value)? idle,
    TResult Function(ForgotPasswordState$Processing value)? processing,
    TResult Function(ForgotPasswordState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordState$Idle extends ForgotPasswordState {
  const factory ForgotPasswordState$Idle({required final Object? error}) =
      _$ForgotPasswordState$IdleImpl;
  const ForgotPasswordState$Idle._() : super._();

  Object? get error;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordState$IdleImplCopyWith<_$ForgotPasswordState$IdleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordState$ProcessingImplCopyWith<$Res> {
  factory _$$ForgotPasswordState$ProcessingImplCopyWith(
          _$ForgotPasswordState$ProcessingImpl value,
          $Res Function(_$ForgotPasswordState$ProcessingImpl) then) =
      __$$ForgotPasswordState$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordState$ProcessingImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordState$ProcessingImpl>
    implements _$$ForgotPasswordState$ProcessingImplCopyWith<$Res> {
  __$$ForgotPasswordState$ProcessingImplCopyWithImpl(
      _$ForgotPasswordState$ProcessingImpl _value,
      $Res Function(_$ForgotPasswordState$ProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForgotPasswordState$ProcessingImpl
    extends ForgotPasswordState$Processing {
  const _$ForgotPasswordState$ProcessingImpl() : super._();

  @override
  String toString() {
    return 'ForgotPasswordState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordState$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function() successful,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function()? successful,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function()? successful,
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
    required TResult Function(ForgotPasswordState$Idle value) idle,
    required TResult Function(ForgotPasswordState$Processing value) processing,
    required TResult Function(ForgotPasswordState$Successful value) successful,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordState$Idle value)? idle,
    TResult? Function(ForgotPasswordState$Processing value)? processing,
    TResult? Function(ForgotPasswordState$Successful value)? successful,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordState$Idle value)? idle,
    TResult Function(ForgotPasswordState$Processing value)? processing,
    TResult Function(ForgotPasswordState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordState$Processing extends ForgotPasswordState {
  const factory ForgotPasswordState$Processing() =
      _$ForgotPasswordState$ProcessingImpl;
  const ForgotPasswordState$Processing._() : super._();
}

/// @nodoc
abstract class _$$ForgotPasswordState$SuccessfulImplCopyWith<$Res> {
  factory _$$ForgotPasswordState$SuccessfulImplCopyWith(
          _$ForgotPasswordState$SuccessfulImpl value,
          $Res Function(_$ForgotPasswordState$SuccessfulImpl) then) =
      __$$ForgotPasswordState$SuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordState$SuccessfulImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordState$SuccessfulImpl>
    implements _$$ForgotPasswordState$SuccessfulImplCopyWith<$Res> {
  __$$ForgotPasswordState$SuccessfulImplCopyWithImpl(
      _$ForgotPasswordState$SuccessfulImpl _value,
      $Res Function(_$ForgotPasswordState$SuccessfulImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForgotPasswordState$SuccessfulImpl
    extends ForgotPasswordState$Successful {
  const _$ForgotPasswordState$SuccessfulImpl() : super._();

  @override
  String toString() {
    return 'ForgotPasswordState.successful()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordState$SuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) idle,
    required TResult Function() processing,
    required TResult Function() successful,
  }) {
    return successful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error)? idle,
    TResult? Function()? processing,
    TResult? Function()? successful,
  }) {
    return successful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? idle,
    TResult Function()? processing,
    TResult Function()? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordState$Idle value) idle,
    required TResult Function(ForgotPasswordState$Processing value) processing,
    required TResult Function(ForgotPasswordState$Successful value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordState$Idle value)? idle,
    TResult? Function(ForgotPasswordState$Processing value)? processing,
    TResult? Function(ForgotPasswordState$Successful value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordState$Idle value)? idle,
    TResult Function(ForgotPasswordState$Processing value)? processing,
    TResult Function(ForgotPasswordState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordState$Successful extends ForgotPasswordState {
  const factory ForgotPasswordState$Successful() =
      _$ForgotPasswordState$SuccessfulImpl;
  const ForgotPasswordState$Successful._() : super._();
}
