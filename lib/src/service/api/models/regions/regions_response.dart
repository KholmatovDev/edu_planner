// To parse this JSON data, do
//
//     final regionsResponse = regionsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'regions_response.freezed.dart';
part 'regions_response.g.dart';

RegionsResponse regionsResponseFromJson(String str) => RegionsResponse.fromJson(json.decode(str));

String regionsResponseToJson(RegionsResponse data) => json.encode(data.toJson());

@freezed
class RegionsResponse with _$RegionsResponse {
  const factory RegionsResponse({
    @JsonKey(name: "success")
    required bool success,
    @JsonKey(name: "count")
    required int count,
    @JsonKey(name: "regions")
    required List<Region> regions,
  }) = _RegionsResponse;

  factory RegionsResponse.fromJson(Map<String, dynamic> json) => _$RegionsResponseFromJson(json);
}

@freezed
class Region with _$Region {
  const factory Region({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "description")
    required String description,
    @JsonKey(name: "status")
    required String status,
    @JsonKey(name: "createdAt")
    required String createdAt,
    @JsonKey(name: "updatedAt")
    required String updatedAt,
    @JsonKey(name: "__v")
    required int v,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
