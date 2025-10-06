import 'package:athlio/core/networking/sign_up_api_error_model.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:athlio/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:athlio/features/sign_up/service/sign_up_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImplement implements SignUpRepo {
  final SignUpService signUpService;

  SignUpRepoImplement(this.signUpService);

  @override
  Future<Either<SignUpErrorModel, SignUpResponseModel>> signUp(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      final response = await signUpService.signUp(signUpRequestBody);
      return Right(response);
    } on DioException catch (e) {
      return Left(
        SignUpErrorModel.fromJson(e.response?.data as Map<String, dynamic>),
      );
    }
  }
}
