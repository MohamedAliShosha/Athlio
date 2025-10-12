import 'package:athlio/core/utils/app_colors.dart';
import 'package:athlio/features/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 80, color: AppColors.kBlackColor),
              SizedBox(height: 20),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.kBlack87Color,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              // Email Field
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
