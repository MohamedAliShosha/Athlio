import 'package:flutter/material.dart';

OutlineInputBorder buildFocusedBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color), // Border color when focused
    borderRadius: BorderRadius.circular(8),
  );
}
