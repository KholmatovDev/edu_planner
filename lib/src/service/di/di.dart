import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../api/dio/custom_dio.dart';
import '../api/dio/secure_storage.dart';
import '../api/api_provider/api_provider.dart';
import '../api/services/api_services.dart';
import '../api/services/services.dart';
import '../navigation/navigation_service.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  locator.registerLazySingleton<SecureStorage>(() => SecureStorage());

  locator.registerLazySingleton<CustomDio>(() => CustomDio());

  locator.registerLazySingleton<ApiProvider>(
        () => ApiProvider(
      locator<CustomDio>().get,
      baseUrl: ApiServiceRouters.apiForClient,
    ),
  );

  locator.registerLazySingleton<ApiServices>(
        () => ApiServices(),
  );

  locator.registerLazySingleton<ScrollController>(() => ScrollController());
}
