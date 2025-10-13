import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({super.key, required this.tagTitle});

  final String tagTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tagTitle,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
