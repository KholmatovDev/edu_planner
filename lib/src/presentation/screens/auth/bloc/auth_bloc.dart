import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:edu_planner/src/presentation/screens/auth/auth_screen.dart';
import 'package:edu_planner/src/service/api/api_provider/api_provider.dart';
import 'package:edu_planner/src/service/api/dio/custom_dio.dart';
import 'package:edu_planner/src/service/api/dio/secure_storage.dart';
import 'package:edu_planner/src/service/api/models/register_request/register_request.dart';
import 'package:edu_planner/src/service/di/di.dart';
import 'package:edu_planner/src/service/navigation/navigation_service.dart';
import 'package:edu_planner/src/service/navigation/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../service/api/services/api_services.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final apiProvider = locator.get<ApiServices>().getApiProvider();
  final _storage = locator.get<SecureStorage>();

  AuthBloc() : super(const AuthState.initial(isLoading: false)) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        login: (username, password) async {
          emit(state.copyWith(isLoading: true));
          final result = await apiProvider.userLogin(
              RegisterRequest(username: username, password: password));
          _storage.setAccess(result.token);
          _storage.setRole(result.user.role);
          print(result);
          emit(state.copyWith(isLoading: false));
          NavigationService.context.push(RoutingConstants.home);
          if(_storage.getAccess()!=null){
            NavigationService.context.push(RoutingConstants.home);
          }
        },
        register: (username, password) async {
          emit(state.copyWith(isLoading: true));
          final result = await apiProvider.userRegister(
              RegisterRequest(username: username, password: password));
          _storage.setAccess(result.token);
          _storage.setRole(result.user.role);
          print(result);
          emit(state.copyWith(isLoading: false));
          if(_storage.getAccess()!=null){
            NavigationService.context.push(RoutingConstants.home);
          }
        },
      );
    });
  }
}
