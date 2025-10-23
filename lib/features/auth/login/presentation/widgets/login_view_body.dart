import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

import 'login_form.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: AppColors.kBlackColor),
            const SizedBox(height: 20),
            Text("Welcome back you've been missed!",
                style: TextStyles.bold18.copyWith(
                  color: AppColors.kBlack87Color,
                )),
            const SizedBox(height: 25),
            // Email Field
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
