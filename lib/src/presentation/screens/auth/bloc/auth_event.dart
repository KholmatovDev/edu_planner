part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.register({required String username,required String password}) = _Register;
  const factory AuthEvent.login({required String username,required String password}) = _Login;
}
