
import 'package:flutter/material.dart';

class Constants{
  static final Color backgroundColor = Color(0xFF000000);
  static final Color shadowolor = Color(0xFFd3d3d3);
  static final Color textColor = Color(0xFFffffff);
  static final String fontFamily = 'Raleway';
  static final int fontSize = 35;
  static final BoxDecoration decorationBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Constants.backgroundColor,
        Constants.backgroundColor
      ],
    ),
  );

}