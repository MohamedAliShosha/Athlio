import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.kBlack87Color,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      onTap: () {
                        context.pop();
                        context.push(AppRouter.kProfileView);
                      },
                      leading: const Icon(Icons.person,
                          color: AppColors.kWhiteColor),
                      title: const Text(
                        "Profile",
                        style: TextStyle(
                            color: AppColors.kWhiteColor, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        context.pop();
                        context.push(AppRouter.kWorkoutSplitsView);
                      },
                      leading: const Icon(Icons.fitness_center,
                          color: AppColors.kWhiteColor),
                      title: const Text(
                        "Workout splits",
                        style: TextStyle(
                            color: AppColors.kWhiteColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
