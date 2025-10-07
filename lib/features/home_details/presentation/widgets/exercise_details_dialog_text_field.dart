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
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
