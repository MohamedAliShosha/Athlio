import 'package:athlio/core/networking/api_error_model.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<ApiErrorModel, SignUpResponseModel>> signUp(
      {required SignUpRequestBody signUpRequestBody});
}
