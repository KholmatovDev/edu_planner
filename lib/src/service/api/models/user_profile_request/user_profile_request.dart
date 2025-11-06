// To parse this JSON data, do
//
//     final userProfileRequest = userProfileRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_profile_request.freezed.dart';
part 'user_profile_request.g.dart';

UserProfileRequest userProfileRequestFromJson(String str) => UserProfileRequest.fromJson(json.decode(str));

String userProfileRequestToJson(UserProfileRequest data) => json.encode(data.toJson());

@freezed
class UserProfileRequest with _$UserProfileRequest {
  const factory UserProfileRequest({
    @JsonKey(name: "full_name")
    required String fullName,
    @JsonKey(name: "school_id")
    required String schoolId,
    @JsonKey(name: "class_id")
    required String classId,
  }) = _UserProfileRequest;

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) => _$UserProfileRequestFromJson(json);
}
