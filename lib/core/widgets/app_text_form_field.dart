import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable TextField
class AppTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.validator,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  // changing fields are written at State object part.
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: AppColors.kBlackColor,
      keyboardType: widget.keyboardType,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      obscureText: widget.isPassword
          ? _obscureText
          : false, // Text here is hidden when isPassword is true
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.kBlackColor,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.kBlackColor,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
