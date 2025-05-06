// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'authenticated':
      return User$Authenticated.fromJson(json);
    case 'notAuthenticated':
      return User$NotAuthenticated.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'User',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool emailVerified, String? email)
        authenticated,
    required TResult Function() notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult? Function()? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User$Authenticated value) authenticated,
    required TResult Function(User$NotAuthenticated value) notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User$Authenticated value)? authenticated,
    TResult? Function(User$NotAuthenticated value)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User$Authenticated value)? authenticated,
    TResult Function(User$NotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$User$AuthenticatedImplCopyWith<$Res> {
  factory _$$User$AuthenticatedImplCopyWith(_$User$AuthenticatedImpl value,
          $Res Function(_$User$AuthenticatedImpl) then) =
      __$$User$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, bool emailVerified, String? email});
}

/// @nodoc
class __$$User$AuthenticatedImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$User$AuthenticatedImpl>
    implements _$$User$AuthenticatedImplCopyWith<$Res> {
  __$$User$AuthenticatedImplCopyWithImpl(_$User$AuthenticatedImpl _value,
      $Res Function(_$User$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailVerified = null,
    Object? email = freezed,
  }) {
    return _then(_$User$AuthenticatedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User$AuthenticatedImpl extends User$Authenticated {
  const _$User$AuthenticatedImpl(
      {required this.id,
      required this.emailVerified,
      this.email,
      final String? $type})
      : $type = $type ?? 'authenticated',
        super._();

  factory _$User$AuthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$User$AuthenticatedImplFromJson(json);

  @override
  final String id;
  @override
  final bool emailVerified;
  @override
  final String? email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.authenticated(id: $id, emailVerified: $emailVerified, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User$AuthenticatedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emailVerified, email);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$User$AuthenticatedImplCopyWith<_$User$AuthenticatedImpl> get copyWith =>
      __$$User$AuthenticatedImplCopyWithImpl<_$User$AuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool emailVerified, String? email)
        authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return authenticated(id, emailVerified, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return authenticated?.call(id, emailVerified, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(id, emailVerified, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User$Authenticated value) authenticated,
    required TResult Function(User$NotAuthenticated value) notAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User$Authenticated value)? authenticated,
    TResult? Function(User$NotAuthenticated value)? notAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User$Authenticated value)? authenticated,
    TResult Function(User$NotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$User$AuthenticatedImplToJson(
      this,
    );
  }
}

abstract class User$Authenticated extends User {
  const factory User$Authenticated(
      {required final String id,
      required final bool emailVerified,
      final String? email}) = _$User$AuthenticatedImpl;
  const User$Authenticated._() : super._();

  factory User$Authenticated.fromJson(Map<String, dynamic> json) =
      _$User$AuthenticatedImpl.fromJson;

  String get id;
  bool get emailVerified;
  String? get email;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$User$AuthenticatedImplCopyWith<_$User$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$User$NotAuthenticatedImplCopyWith<$Res> {
  factory _$$User$NotAuthenticatedImplCopyWith(
          _$User$NotAuthenticatedImpl value,
          $Res Function(_$User$NotAuthenticatedImpl) then) =
      __$$User$NotAuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$User$NotAuthenticatedImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$User$NotAuthenticatedImpl>
    implements _$$User$NotAuthenticatedImplCopyWith<$Res> {
  __$$User$NotAuthenticatedImplCopyWithImpl(_$User$NotAuthenticatedImpl _value,
      $Res Function(_$User$NotAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$User$NotAuthenticatedImpl extends User$NotAuthenticated {
  const _$User$NotAuthenticatedImpl({final String? $type})
      : $type = $type ?? 'notAuthenticated',
        super._();

  factory _$User$NotAuthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$User$NotAuthenticatedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.notAuthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User$NotAuthenticatedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool emailVerified, String? email)
        authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return notAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool emailVerified, String? email)?
        authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User$Authenticated value) authenticated,
    required TResult Function(User$NotAuthenticated value) notAuthenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User$Authenticated value)? authenticated,
    TResult? Function(User$NotAuthenticated value)? notAuthenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User$Authenticated value)? authenticated,
    TResult Function(User$NotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$User$NotAuthenticatedImplToJson(
      this,
    );
  }
}

abstract class User$NotAuthenticated extends User {
  const factory User$NotAuthenticated() = _$User$NotAuthenticatedImpl;
  const User$NotAuthenticated._() : super._();

  factory User$NotAuthenticated.fromJson(Map<String, dynamic> json) =
      _$User$NotAuthenticatedImpl.fromJson;
}
