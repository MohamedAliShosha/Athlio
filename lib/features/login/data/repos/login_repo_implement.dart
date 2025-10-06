import 'package:athlio/features/login/data/models/login_api_error_model.dart';
import 'package:athlio/features/login/data/models/login_request_body.dart';
import 'package:athlio/features/login/data/models/login_response.dart';
import 'package:athlio/features/login/data/repos/login_repo.dart';
import 'package:athlio/features/login/service/login_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImplement implements LoginRepo {
  final LoginService loginService;

  LoginRepoImplement(this.loginService);

  @override
  Future<Either<LoginApiErrorModel, LoginResponseModel>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await loginService.login(loginRequestBody);
      return Right(response);
    } on DioException catch (e) {
      return Left(
        LoginApiErrorModel.fromJson(e.response?.data),
      );
    }
  }
}
