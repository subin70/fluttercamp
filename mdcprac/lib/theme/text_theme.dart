import 'package:flutter/material.dart';
import 'textstyle.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(button : TextStyle(fontSize:15)),

  elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
          primary : kShrinePink100,
          onPrimary: kShrineBrown900,
      ),
  ),
);