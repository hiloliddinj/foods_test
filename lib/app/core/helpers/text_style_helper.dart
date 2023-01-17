
import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/font_const.dart';

class TextStyleHelper {

  static TextStyle overpass({
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConst.overpass,
      fontWeight: fontWeight
    );
  }

}