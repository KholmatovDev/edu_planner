import 'package:dio/dio.dart';
import 'package:edu_planner/src/service/api/models/classes/classes_response.dart';
import 'package:edu_planner/src/service/api/models/regions/regions_response.dart';
import 'package:edu_planner/src/service/api/models/schools/schools_response.dart';
import 'package:edu_planner/src/service/api/models/user_profile_request/user_profile_request.dart';
import 'package:edu_planner/src/service/api/models/user_profile_response/user_profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/my_schedules/schedules_response.dart';
import '../models/register_request/register_request.dart';
import '../models/register_response/auth_response.dart';
import '../services/services.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: ApiServiceRouters.apiForClient)

abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @POST("/auth/register")
  Future<AuthResponse> userRegister(@Body() RegisterRequest register);

  @POST("/auth/login")
  Future<AuthResponse> userLogin(@Body() RegisterRequest register);

  @PUT("/users/profile")
  Future<UserProfileResponse> setUserProfile(@Body() UserProfileRequest request);

  @GET("/subjects/my-schedule")
  Future<SchedulesResponse> getSchedules();

  @GET("/regions")
  Future<RegionsResponse> getRegions();

  @GET("/schools")
  Future<SchoolsResponse> getSchools(@Query("region_id") String regionID);

  @GET("/schools/{id}/classes")
  Future<ClassesResponse> getClasses(@Path("id") String id);
}
