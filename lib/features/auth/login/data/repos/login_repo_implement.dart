import '../models/login_api_error_model.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';
import 'login_repo.dart';
import '../../service/login_service.dart';
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
      if (e.response != null && e.response?.data != null) {
        // Server responded with an error
        return Left(LoginApiErrorModel.fromJson(e.response!.data));
      } else {
        // No response (network, SSL, timeout, etc.)
        return Left(LoginApiErrorModel(message: e.message ?? 'Unknown error'));
      }
    } catch (e) {
      // Any other error
      return Left(
        LoginApiErrorModel(
          message: e.toString(),
        ),
      );
    }
  }
}
