import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/shared_pref_keys.dart';
import '../../../../core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your image asset
              Image.asset(
                "assets/images/Generated_Image_October_09__2025_-_11_31AM__1_-removebg-preview.png", // put your image in assets
                height: 150,
              ),
              const SizedBox(height: 40),
              const Text(
                "Your Workout\nCompanion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kBlackColor,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Track your daily workouts & watch your progress!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.kBlack54Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              AppButton(
                fontWeight: FontWeight.bold,
                text: "Get Started",
                onPressed: () {
                  // Navigate to homeView if the user is already loggedIn, If not navigate to loginView
                  isLoggedInUser
                      ? GoRouter.of(context).go(AppRouter.kHomeView)
                      : GoRouter.of(context).go(AppRouter.kLoginView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
