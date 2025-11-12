// To parse this JSON data, do
//
//     final subjects = subjectsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'subjects.freezed.dart';
part 'subjects.g.dart';

Subjects subjectsFromJson(String str) => Subjects.fromJson(json.decode(str));

String subjectsToJson(Subjects data) => json.encode(data.toJson());

@freezed
class Subjects with _$Subjects {
  const factory Subjects({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "count")
    required int count,
    @JsonKey(name: "subjects")
    required List<Subject> subjects,
  }) = _Subjects;

  factory Subjects.fromJson(Map<String, dynamic> json) => _$SubjectsFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "teacher_fullname")
    required String teacherFullname,
    @JsonKey(name: "class_id")
    required ClassId classId,
    @JsonKey(name: "weekday")
    required int weekday,
    @JsonKey(name: "start_time")
    required String startTime,
    @JsonKey(name: "end_time")
    required String endTime,
    @JsonKey(name: "classroom")
    required String classroom,
    @JsonKey(name: "is_now")
    required bool isNow,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
}

@freezed
class ClassId with _$ClassId {
  const factory ClassId({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "name")
    required String name,
  }) = _ClassId;

  factory ClassId.fromJson(Map<String, dynamic> json) => _$ClassIdFromJson(json);
}
