import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

import 'sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
      child: Column(
        children: [
          const Icon(
            Icons.person,
            size: 80,
            color: AppColors.kBlackColor,
          ),
          const SizedBox(height: 20),
          Text(
            "Create Account",
            style: TextStyles.bold18.copyWith(
              color: AppColors.kBlackColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Sign up to get started",
            style: TextStyles.bold16.copyWith(
              color: AppColors.kBlack54Color,
            ),
          ),
          const SizedBox(height: 30),
          const SignUpForm(),
        ],
      ),
    );
  }
}
