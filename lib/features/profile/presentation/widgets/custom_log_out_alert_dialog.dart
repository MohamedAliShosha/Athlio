import 'package:flutter/material.dart';

class CustomLogOutAlertDialog extends StatelessWidget {
  const CustomLogOutAlertDialog({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.cancelButton,
    required this.logoutButton,
  });

  final String titleText;
  final String contentText;
  final String cancelButton;
  final String logoutButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black87,
      title: Text(
        titleText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        contentText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          // return false if dialog is dismissed
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            cancelButton,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          // return true if user clicks "Logout"
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            logoutButton,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
