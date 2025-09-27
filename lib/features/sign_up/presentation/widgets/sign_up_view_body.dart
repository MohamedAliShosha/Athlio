import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/widgets/app_button.dart';
import 'package:athlio/core/widgets/app_text_field.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 80, color: Colors.black),

            const SizedBox(height: 20),
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sign up to get started",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 30),

            // Full Name
            const AppTextField(
              hintText: "Full Name",
              isPassword: false,
            ),
            const SizedBox(height: 15),

            // Email
            const AppTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              isPassword: false,
            ),
            const SizedBox(height: 15),

            // Password
            const AppTextField(
              hintText: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 15),

            // Confirm Password
            const AppTextField(
              hintText: "Confirm Password",
              isPassword: true,
            ),

            const SizedBox(height: 25),
            // Sign Up Button
            AppButton(
              text: "Sign Up",
              onPressed: () {
                // Handle sign up logic
              },
            ),

            const SizedBox(height: 30),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Divider(thickness: 0.5, color: Colors.grey[400]),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10),
            //       child: Text("Or sign up with",
            //           style: TextStyle(color: Colors.grey[700])),
            //     ),
            //     Expanded(
            //       child: Divider(thickness: 0.5, color: Colors.grey[400]),
            //     ),
            //   ],
            // ),

            // const SizedBox(height: 25),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SocialButton(icon: Icons.g_mobiledata),
            //     SizedBox(width: 20),
            //     SocialButton(icon: Icons.facebook),
            //   ],
            // ),

            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    // Navigate to Login Screen
                    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.blue,
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
