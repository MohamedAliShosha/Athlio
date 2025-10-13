import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsDialogTextField extends StatelessWidget {
  const ExerciseDetailsDialogTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.autovalidateMode,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autovalidateMode,
      cursorColor: AppColors.kWhiteColor,
      controller: controller,
      style: const TextStyle(color: AppColors.kWhiteColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.kWhite54Color),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kWhite54Color),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
