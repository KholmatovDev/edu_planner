// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "token")
    required String token,
    @JsonKey(name: "user")
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id")
    required String id,
    @JsonKey(name: "username")
    required String username,
    @JsonKey(name: "role")
    required String role,
    @JsonKey(name: "full_name")
    required String fullName,
    @JsonKey(name: "school_id")
    required dynamic schoolId,
    @JsonKey(name: "class_id")
    required dynamic classId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
