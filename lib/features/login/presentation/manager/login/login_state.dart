part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess(this.loginResponseModel);
}

final class LoginError extends LoginState {
  final ApiErrorModel apiErrorModel;

  LoginError({required this.apiErrorModel});
}
