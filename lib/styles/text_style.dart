import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart'; // Assuming color.dart is in the same directory

class CustomTextStyle {

  static TextStyle primaryBlack = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: blackGreen,
  );

  static TextStyle biggerBlack = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: blackGreen,
  );

  static TextStyle secondaryGrey = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: textGrey,
  );

  static TextStyle boldHeader = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: blackGreen,
  );

  static TextStyle bigTitle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: blackGreen,
  );

  static TextStyle bigTitleYellow = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: mainYellow,
  );
}