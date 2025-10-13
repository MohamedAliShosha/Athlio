import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable Button
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final FontWeight? fontWeight;

  const AppButton(
      {super.key,
      required this.text,
      this.fontWeight,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      // // the button will not respond to user interactions while loading this is useful to disable the button while loading process is going on to prevent multiple clicks
      ignoring: isLoading == true,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kBlackColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onPressed,
          child: isLoading == true
              ? const CircularProgressIndicator(
                  color: AppColors.kWhiteColor,
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: AppColors.kWhiteColor,
                      fontSize: 18,
                      fontWeight: fontWeight),
                ),
        ),
      ),
    );
  }
}
