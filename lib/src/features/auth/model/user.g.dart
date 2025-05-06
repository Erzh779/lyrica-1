// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$User$AuthenticatedImpl _$$User$AuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$User$AuthenticatedImpl(
      id: json['id'] as String,
      emailVerified: json['emailVerified'] as bool,
      email: json['email'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$User$AuthenticatedImplToJson(
        _$User$AuthenticatedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emailVerified': instance.emailVerified,
      'email': instance.email,
      'runtimeType': instance.$type,
    };

_$User$NotAuthenticatedImpl _$$User$NotAuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$User$NotAuthenticatedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$User$NotAuthenticatedImplToJson(
        _$User$NotAuthenticatedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
