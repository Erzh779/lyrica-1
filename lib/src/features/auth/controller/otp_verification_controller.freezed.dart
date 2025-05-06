// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpVerificationState {
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, Object? error) idle,
    required TResult Function(String email) processing,
    required TResult Function(String email) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, Object? error)? idle,
    TResult? Function(String email)? processing,
    TResult? Function(String email)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, Object? error)? idle,
    TResult Function(String email)? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpVerificationState$Idle value) idle,
    required TResult Function(OtpVerificationState$Processing value) processing,
    required TResult Function(OtpVerificationState$Successful value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpVerificationState$Idle value)? idle,
    TResult? Function(OtpVerificationState$Processing value)? processing,
    TResult? Function(OtpVerificationState$Successful value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpVerificationState$Idle value)? idle,
    TResult Function(OtpVerificationState$Processing value)? processing,
    TResult Function(OtpVerificationState$Successful value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationStateCopyWith<OtpVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationStateCopyWith<$Res> {
  factory $OtpVerificationStateCopyWith(OtpVerificationState value,
          $Res Function(OtpVerificationState) then) =
      _$OtpVerificationStateCopyWithImpl<$Res, OtpVerificationState>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$OtpVerificationStateCopyWithImpl<$Res,
        $Val extends OtpVerificationState>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpVerificationState$IdleImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationState$IdleImplCopyWith(
          _$OtpVerificationState$IdleImpl value,
          $Res Function(_$OtpVerificationState$IdleImpl) then) =
      __$$OtpVerificationState$IdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, Object? error});
}

/// @nodoc
class __$$OtpVerificationState$IdleImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res,
        _$OtpVerificationState$IdleImpl>
    implements _$$OtpVerificationState$IdleImplCopyWith<$Res> {
  __$$OtpVerificationState$IdleImplCopyWithImpl(
      _$OtpVerificationState$IdleImpl _value,
      $Res Function(_$OtpVerificationState$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? error = freezed,
  }) {
    return _then(_$OtpVerificationState$IdleImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$OtpVerificationState$IdleImpl extends OtpVerificationState$Idle {
  const _$OtpVerificationState$IdleImpl(
      {required this.email, required this.error})
      : super._();

  @override
  final String email;
  @override
  final Object? error;

  @override
  String toString() {
    return 'OtpVerificationState.idle(email: $email, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationState$IdleImpl &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, const DeepCollectionEquality().hash(error));

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationState$IdleImplCopyWith<_$OtpVerificationState$IdleImpl>
      get copyWith => __$$OtpVerificationState$IdleImplCopyWithImpl<
          _$OtpVerificationState$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, Object? error) idle,
    required TResult Function(String email) processing,
    required TResult Function(String email) successful,
  }) {
    return idle(email, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, Object? error)? idle,
    TResult? Function(String email)? processing,
    TResult? Function(String email)? successful,
  }) {
    return idle?.call(email, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, Object? error)? idle,
    TResult Function(String email)? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(email, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpVerificationState$Idle value) idle,
    required TResult Function(OtpVerificationState$Processing value) processing,
    required TResult Function(OtpVerificationState$Successful value) successful,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpVerificationState$Idle value)? idle,
    TResult? Function(OtpVerificationState$Processing value)? processing,
    TResult? Function(OtpVerificationState$Successful value)? successful,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpVerificationState$Idle value)? idle,
    TResult Function(OtpVerificationState$Processing value)? processing,
    TResult Function(OtpVerificationState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class OtpVerificationState$Idle extends OtpVerificationState {
  const factory OtpVerificationState$Idle(
      {required final String email,
      required final Object? error}) = _$OtpVerificationState$IdleImpl;
  const OtpVerificationState$Idle._() : super._();

  @override
  String get email;
  Object? get error;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationState$IdleImplCopyWith<_$OtpVerificationState$IdleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpVerificationState$ProcessingImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationState$ProcessingImplCopyWith(
          _$OtpVerificationState$ProcessingImpl value,
          $Res Function(_$OtpVerificationState$ProcessingImpl) then) =
      __$$OtpVerificationState$ProcessingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$OtpVerificationState$ProcessingImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res,
        _$OtpVerificationState$ProcessingImpl>
    implements _$$OtpVerificationState$ProcessingImplCopyWith<$Res> {
  __$$OtpVerificationState$ProcessingImplCopyWithImpl(
      _$OtpVerificationState$ProcessingImpl _value,
      $Res Function(_$OtpVerificationState$ProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$OtpVerificationState$ProcessingImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpVerificationState$ProcessingImpl
    extends OtpVerificationState$Processing {
  const _$OtpVerificationState$ProcessingImpl({required this.email})
      : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'OtpVerificationState.processing(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationState$ProcessingImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationState$ProcessingImplCopyWith<
          _$OtpVerificationState$ProcessingImpl>
      get copyWith => __$$OtpVerificationState$ProcessingImplCopyWithImpl<
          _$OtpVerificationState$ProcessingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, Object? error) idle,
    required TResult Function(String email) processing,
    required TResult Function(String email) successful,
  }) {
    return processing(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, Object? error)? idle,
    TResult? Function(String email)? processing,
    TResult? Function(String email)? successful,
  }) {
    return processing?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, Object? error)? idle,
    TResult Function(String email)? processing,
    TResult Function(String email)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtpVerificationState$Idle value) idle,
    required TResult Function(OtpVerificationState$Processing value) processing,
    required TResult Function(OtpVerificationState$Successful value) successful,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpVerificationState$Idle value)? idle,
    TResult? Function(OtpVerificationState$Processing value)? processing,
    TResult? Function(OtpVerificationState$Successful value)? successful,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpVerificationState$Idle value)? idle,
    TResult Function(OtpVerificationState$Processing value)? processing,
    TResult Function(OtpVerificationState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class OtpVerificationState$Processing extends OtpVerificationState {
  const factory OtpVerificationState$Processing({required final String email}) =
      _$OtpVerificationState$ProcessingImpl;
  const OtpVerificationState$Processing._() : super._();

  @override
  String get email;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationState$ProcessingImplCopyWith<
          _$OtpVerificationState$ProcessingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpVerificationState$SuccessfulImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationState$SuccessfulImplCopyWith(
          _$OtpVerificationState$SuccessfulImpl value,
          $Res Function(_$OtpVerificationState$SuccessfulImpl) then) =
      __$$OtpVerificationState$SuccessfulImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$OtpVerificationState$SuccessfulImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res,
        _$OtpVerificationState$SuccessfulImpl>
    implements _$$OtpVerificationState$SuccessfulImplCopyWith<$Res> {
  __$$OtpVerificationState$SuccessfulImplCopyWithImpl(
      _$OtpVerificationState$SuccessfulImpl _value,
      $Res Function(_$OtpVerificationState$SuccessfulImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$OtpVerificationState$SuccessfulImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpVerificationState$SuccessfulImpl
    extends OtpVerificationState$Successful {
  const _$OtpVerificationState$SuccessfulImpl({required this.email})
      : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'OtpVerificationState.successful(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationState$SuccessfulImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationState$SuccessfulImplCopyWith<
          _$OtpVerificationState$SuccessfulImpl>
      get copyWith => __$$OtpVerificationState$SuccessfulImplCopyWithImpl<
          _$OtpVerificationState$SuccessfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, Object? error) idle,
    required TResult Function(String email) processing,
    required TResult Function(String email) successful,
  }) {
    return successful(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, Object? error)? idle,
    TResult? Function(String email)? processing,
    TResult? Function(String email)? successful,
  }) {
    return successful?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, Object? error)? idle,
    TResult Function(String email)? processing,
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
    required TResult Function(OtpVerificationState$Idle value) idle,
    required TResult Function(OtpVerificationState$Processing value) processing,
    required TResult Function(OtpVerificationState$Successful value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtpVerificationState$Idle value)? idle,
    TResult? Function(OtpVerificationState$Processing value)? processing,
    TResult? Function(OtpVerificationState$Successful value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtpVerificationState$Idle value)? idle,
    TResult Function(OtpVerificationState$Processing value)? processing,
    TResult Function(OtpVerificationState$Successful value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class OtpVerificationState$Successful extends OtpVerificationState {
  const factory OtpVerificationState$Successful({required final String email}) =
      _$OtpVerificationState$SuccessfulImpl;
  const OtpVerificationState$Successful._() : super._();

  @override
  String get email;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationState$SuccessfulImplCopyWith<
          _$OtpVerificationState$SuccessfulImpl>
      get copyWith => throw _privateConstructorUsedError;
}
