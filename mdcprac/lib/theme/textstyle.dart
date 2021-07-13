import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';


TextStyle titleStyle({double? height, Color? color}){
  return GoogleFonts.lobster(
    fontSize: 24.0,
    height: height ?? 1.4,
    color: kShrinePink400 ,
  );
}
TextStyle bodyStyle1({double? height, Color? color}){
  return GoogleFonts.rubik(
    fontSize: 15,
    height: 0.5,
    color: kShrinePink400 ,
  );
}
TextStyle bodyStyle2({double? height, Color? color}){
  return GoogleFonts.rubik(
    fontSize: 10,
    height: 0.2,
    color: kShrinePink400 ,
  );
}