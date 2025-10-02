import 'package:athlio/core/networking/api_error_model.dart';
import 'package:athlio/features/login/data/models/login_request_body.dart';
import 'package:athlio/features/login/data/models/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<ApiErrorModel, LoginResponseModel>> login(
      {required LoginRequestBody loginRequestBody});
}
