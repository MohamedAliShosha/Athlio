import 'package:athlio/core/networking/api_error_model.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:athlio/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
      },
    );
  }
}
