import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

AppBar drawerAppBar({void Function()? onPressed}) {
  return AppBar(
    surfaceTintColor: Colors.transparent, // ✅ disable Material 3 tinting

    backgroundColor: AppColors.kWhiteColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: AppColors.kBlack87Color,
      ),
      onPressed: onPressed,
    ),
  );
}
