import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      color: Color(0XFF868889),
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      color: Color(0XFFFFFFFF),
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  ),
);
