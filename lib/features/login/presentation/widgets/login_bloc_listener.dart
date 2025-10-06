import 'package:athlio/core/functions/build_snack_bar.dart';
import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/features/login/presentation/manager/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(message: state.loginApiErrorModel.message),
          );
        } else if (state is LoginSuccess) {
          // go => Navigates to the new screen and remove the current screen from the stack better with go_router than pushReplacement as it keeps the state of the current screen if I exist the app and return back the last opened screen will be displayed
          GoRouter.of(context).go(AppRouter.kHomeView);
        }
      },
    );
  }
}
