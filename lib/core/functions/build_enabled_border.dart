import 'package:flutter/material.dart';

OutlineInputBorder buildEnabledBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color), // Normal border color
    borderRadius: BorderRadius.circular(8), // Rounded corners
  );
}
