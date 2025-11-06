// To parse this JSON data, do
//
//     final schedulesResponse = schedulesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'schedules_response.freezed.dart';
part 'schedules_response.g.dart';

SchedulesResponse schedulesResponseFromJson(String str) => SchedulesResponse.fromJson(json.decode(str));

String schedulesResponseToJson(SchedulesResponse data) => json.encode(data.toJson());

@freezed
class SchedulesResponse with _$SchedulesResponse {
  const factory SchedulesResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "today_weekday")
    required int todayWeekday,
    @JsonKey(name: "schedule")
    required Schedule schedule,
  }) = _SchedulesResponse;

  factory SchedulesResponse.fromJson(Map<String, dynamic> json) => _$SchedulesResponseFromJson(json);
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @JsonKey(name: "1")
    required List<The1> the1,
    @JsonKey(name: "2")
    required List<The1> the2,
    @JsonKey(name: "3")
    required List<The1> the3,
    @JsonKey(name: "4")
    required List<The1> the4,
    @JsonKey(name: "5")
    required List<The1> the5,
    @JsonKey(name: "6")
    required List<The1> the6,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}

@freezed
class The1 with _$The1 {
  const factory The1({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "class_id")
    required ClassId classId,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "teacher_fullname")
    required String teacherFullname,
    @JsonKey(name: "weekday")
    required int weekday,
    @JsonKey(name: "start_time")
    required String startTime,
    @JsonKey(name: "end_time")
    required String endTime,
    @JsonKey(name: "classroom")
    required String classroom,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
    @JsonKey(name: "is_now")
    required bool isNow,
  }) = _The1;

  factory The1.fromJson(Map<String, dynamic> json) => _$The1FromJson(json);
}

@freezed
class ClassId with _$ClassId {
  const factory ClassId({
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
  }) = _ClassId;

  factory ClassId.fromJson(Map<String, dynamic> json) => _$ClassIdFromJson(json);
}
