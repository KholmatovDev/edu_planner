// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      fullName: json['full_name'] as String,
      regionId: json['region_id'] as String,
      schoolId: json['school_id'] as String,
      classId: json['class_id'] as String,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'full_name': instance.fullName,
      'region_id': instance.regionId,
      'school_id': instance.schoolId,
      'class_id': instance.classId,
    };
