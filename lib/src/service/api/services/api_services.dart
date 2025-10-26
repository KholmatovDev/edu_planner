import 'package:edu_planner/src/service/api/api_provider/api_provider.dart';
import 'package:edu_planner/src/service/api/dio/custom_dio.dart';

class ApiServices{
  ApiProvider getApiProvider() => ApiProvider(CustomDio().get);
}