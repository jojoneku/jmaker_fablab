import 'package:flutter/material.dart';
import 'color.dart'; // Import your colors file

class CustomFormDecoration extends InputDecoration {
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle labelStyle;

  CustomFormDecoration({
    this.borderColor = secondGrey,
    this.focusedBorderColor = mainYellow,
    this.labelStyle = const TextStyle(color: blackGreen),
    String? labelText,
    String? hintText,
    Widget? suffixIcon,
  }) : super(
    labelText: labelText,
    labelStyle: labelStyle,
    hintText: hintText,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: focusedBorderColor),
    ),
  );
}
