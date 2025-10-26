import 'package:dio/dio.dart';
import 'package:edu_planner/src/service/api/dio/secure_storage.dart';

import '../../di/di.dart';

class CustomDio {
  static final Dio _dio = Dio();
  final secureStorage = locator<SecureStorage>();

  CustomDio() {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorage.getAccess();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get get => _dio;
}
