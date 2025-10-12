import 'package:athlio/core/utils/app_colors.dart';
import 'package:athlio/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: AppColors.kBlackColor),
            SizedBox(height: 20),
            Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kBlackColor),
            ),
            SizedBox(height: 10),
            Text(
              "Sign up to get started",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.kBlack54Color,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
