import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/utils/shared_pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:athlio/core/widgets/app_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace with your image asset
                Image.asset(
                  "assets/images/vector-black-and-white-illustration-of-a-hand-with-dumbbell.jpg", // put your image in assets
                  height: 150,
                ),
                const SizedBox(height: 40),
                const Text(
                  "Your Workout\nCompanion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Track your daily workouts & watch your progress!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: "Get Started",
                  onPressed: () {
                    // Navigate to login screen
                    isLoggedInUser
                        ? GoRouter.of(context).go(AppRouter.kHomeView)
                        : GoRouter.of(context).go(AppRouter.kLoginView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
