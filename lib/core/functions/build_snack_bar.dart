import 'package:flutter/material.dart';

SnackBar buildSnackBar({required String message}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
