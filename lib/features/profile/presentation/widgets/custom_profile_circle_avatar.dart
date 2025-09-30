import 'package:flutter/material.dart';

class CustomProfileCircleAvatar extends StatelessWidget {
  const CustomProfileCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 50,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
