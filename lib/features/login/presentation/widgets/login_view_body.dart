import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/widgets/app_button.dart';
import 'package:athlio/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.black),
              const SizedBox(height: 20),
              const Text(
                "Welcome back you've been missed!",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 25),
              // Email Field
              const AppTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                isPassword: false,
              ),
              const SizedBox(height: 15),
              // Password Field
              const AppTextField(
                hintText: "Password",
                isPassword: true,
              ),

              const SizedBox(height: 20),
              // Login Button
              AppButton(
                text: "Sign In",
                onPressed: () {
                  // handle login
                  // go => Navigates to the new screen and remove the current screen from the stack better with go_router than pushReplacement as it keeps the state of the current screen if I exist the app and return back the last opened screen will be displayed
                  GoRouter.of(context).go(AppRouter.kWorkoutCategoriesView);
                },
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kSignUpView);
                    },
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
