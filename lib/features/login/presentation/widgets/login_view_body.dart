import 'package:athlio/core/widgets/app_button.dart';
import 'package:athlio/core/widgets/app_text_field.dart';
import 'package:athlio/core/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.black),

              const SizedBox(height: 20),
              const Text(
                "Welcome back you've been missed!",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),

              const SizedBox(height: 25),
              // Email Field
              const AppTextField(
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 15),
              // Password Field
              const AppTextField(
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              const SizedBox(height: 20),
              // Login Button
              AppButton(
                text: "Sign In",
                onPressed: () {
                  // handle login
                },
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[400]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or continue with",
                        style: TextStyle(color: Colors.grey[700])),
                  ),
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[400]),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              // Social Login Buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: Icons.g_mobiledata),
                  SizedBox(width: 20),
                  SocialButton(icon: Icons.apple),
                ],
              ),

              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? "),
                  Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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
