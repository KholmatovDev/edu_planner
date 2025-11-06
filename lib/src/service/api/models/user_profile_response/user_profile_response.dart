// To parse this JSON data, do
//
//     final userProfileResponse = userProfileResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_profile_response.freezed.dart';
part 'user_profile_response.g.dart';

UserProfileResponse userProfileResponseFromJson(String str) => UserProfileResponse.fromJson(json.decode(str));

String userProfileResponseToJson(UserProfileResponse data) => json.encode(data.toJson());

@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "user")
    required User user,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "full_name")
    required String fullName,
    @JsonKey(name: "username")
    required String username,
    @JsonKey(name: "role")
    required String role,
    @JsonKey(name: "school_id")
    required Id schoolId,
    @JsonKey(name: "class_id")
    required Id classId,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Id with _$Id {
  const factory Id({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "school_id")
    String? schoolId,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
    @JsonKey(name: "location")
    String? location,
  }) = _Id;

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}
