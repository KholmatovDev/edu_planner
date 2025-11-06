// To parse this JSON data, do
//
//     final classesResponse = classesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'classes_response.freezed.dart';
part 'classes_response.g.dart';


@freezed
class ClassesResponse with _$ClassesResponse {
  const factory ClassesResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "count")
    required int count,
    @JsonKey(name: "classes")
    required List<Class> classes,
  }) = _ClassesResponse;

  factory ClassesResponse.fromJson(Map<String, dynamic> json) => _$ClassesResponseFromJson(json);
}

@freezed
class Class with _$Class {
  const factory Class({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "school_id")
    required String schoolId,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
