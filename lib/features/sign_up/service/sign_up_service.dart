import 'package:athlio/core/networking/api_constants.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignUpService {
  factory SignUpService(Dio dio, {String? baseUrl}) = _SignUpService;

  @POST('/auth/register')
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
