import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyles.regular18.copyWith(
            color: AppColors.kBlackColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to Login Screen
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          },
          child: Text("Sign In",
              style: TextStyles.bold16.copyWith(
                color: AppColors.kBlueColor,
              )),
        ),
      ],
    );
  }
}
