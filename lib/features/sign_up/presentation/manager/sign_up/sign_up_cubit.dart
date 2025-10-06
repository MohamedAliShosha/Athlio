import 'package:athlio/core/networking/sign_up_api_error_model.dart';
import 'package:athlio/core/utils/shared_pref_helper.dart';
import 'package:athlio/core/utils/shared_pref_keys.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:athlio/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUp(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());

    final result =
        await signUpRepo.signUp(signUpRequestBody: signUpRequestBody);
    result.fold(
      (apiErrorModel) {
        emit(
          SignUpFailure(
            apiErrorModel,
          ),
        );
      },
      (signUpResponseModel) {
        emit(
          SignUpSuccess(signUpResponseModel),
        );
        saveUserAccessToken(signUpResponseModel.data.token);
        saveUserName(signUpResponseModel.data.username);
      },
    );
  }
}

/// Method that saves user access token
Future<void> saveUserAccessToken(String? accessToken) async {
  if (accessToken != null) {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, accessToken); // save userToken

    debugPrint('User access token saved: $accessToken');
  } else {
    debugPrint('Access token is null, not saved.');
  }
}

/// Method that saves user refresh token
Future<void> saveUserName(String? userName) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userName, userName!); // save userName

  debugPrint('User name saved: $userName');
}
