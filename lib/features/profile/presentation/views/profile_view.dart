import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_user_info_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomProfileCircleAvatar(),
              const SizedBox(height: 50),
              const CustomUserInfoContainer(
                rightPadding: 40,
                leftPadding: 40,
                text: 'User name',
              ),
              const SizedBox(height: 50),
              const CustomUserInfoContainer(
                rightPadding: 40,
                leftPadding: 40,
                text: 'Email',
              ),
              const SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(AppRouter.kLoginView);
                },
                child: const CustomUserInfoContainer(
                  text: 'Logout',
                  rightPadding: 100,
                  leftPadding: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
