import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData ligthTheme = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'RobotoMono',
      package: 'google_fonts_arabic',
    ),
    subtitle1: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoMono',
      package: 'google_fonts_arabic',
      height: 1.3,
    ),
  ),
);
