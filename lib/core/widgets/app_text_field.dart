import 'package:flutter/material.dart';

/// Reusable TextField
class AppTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  // changing fields are written at State object part.
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
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
                    _obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        hintText: widget.hintText,
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
