import 'package:athlio/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Theme buildDatePickerTheme(BuildContext context, Widget? child) {
  return Theme(
    data: Theme.of(context).copyWith(
      dialogBackgroundColor: AppColors.kBlack87Color, // 🟩 changes background
      colorScheme: const ColorScheme.dark(
        // 🟩 sets dark theme colors
        primary: AppColors.kWhiteColor, // active color (header, selected date)
        surface: Colors.black, // background of the calendar surface
        onSurface: Colors.white70, // text color for days
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor:
              AppColors.kWhiteColor, // 🟩 confirm/cancel button color
        ),
      ),
    ),
    child: child!,
  );
}
