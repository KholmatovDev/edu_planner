// To parse this JSON data, do
//
//     final schoolsResponse = schoolsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'schools_response.freezed.dart';
part 'schools_response.g.dart';



@freezed
class SchoolsResponse with _$SchoolsResponse {
  const factory SchoolsResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "count")
    required int count,
    @JsonKey(name: "schools")
    required List<School> schools,
  }) = _SchoolsResponse;

  factory SchoolsResponse.fromJson(Map<String, dynamic> json) => _$SchoolsResponseFromJson(json);
}

@freezed
class School with _$School {
  const factory School({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "region_id")
    School? regionId,
    @JsonKey(name: "location")
    String? location,
    @JsonKey(name: "status")
    required String status,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
    @JsonKey(name: "description")
    String? description,
  }) = _School;

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
}
