import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 80, color: Colors.black),

            const SizedBox(height: 20),
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sign up to get started",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 30),

            // Full Name
            // const AppTextFormField(
            //   hintText: "Full Name",
            //   isPassword: false,
            // ),
            const SizedBox(height: 15),

            // Email
            // const AppTextFormField(
            //   keyboardType: TextInputType.emailAddress,
            //   hintText: "Email",
            //   isPassword: false,
            // ),
            const SizedBox(height: 15),

            // Password
            // const AppTextFormField(
            //   hintText: "Password",
            //   isPassword: true,
            // ),
            const SizedBox(height: 15),

            // Confirm Password
            // const AppTextFormField(
            //   hintText: "Confirm Password",
            //   isPassword: true,
            // ),

            const SizedBox(height: 20),
            // Sign Up Button
            AppButton(
              text: "Sign Up",
              onPressed: () {
                // Handle sign up logic
                GoRouter.of(context).go(AppRouter.kHomeView);
              },
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Login Screen
                    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
