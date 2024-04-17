import 'package:flutter/material.dart';
import 'color.dart'; // Import your colors file

class CustomFormDecoration extends InputDecoration {
  final Color borderColor = secondGrey;
  final Color focusedBorderColor = mainYellow;
  final TextStyle labelStyle = TextStyle(color: blackGreen);

  CustomFormDecoration({
    borderColor,
    focusedBorderColor,
    labelText,
    labelStyle,
    hintText,
  }) : super(
    labelText: labelText,
    labelStyle: labelStyle,
    hintText: hintText,
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