import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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
}
