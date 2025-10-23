import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a member? ",
          style: TextStyles.regular18.copyWith(
            color: AppColors.kBlackColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
          },
          child: Text(
            "Register now",
            style: TextStyles.bold16.copyWith(
              color: AppColors.kBlueColor,
            ),
          ),
        )
      ],
    );
  }
}
