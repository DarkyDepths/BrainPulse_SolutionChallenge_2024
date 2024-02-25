import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,

  fontFamily: GoogleFonts.urbanist().fontFamily,

  textTheme: TextTheme(
      bodyMedium: AppFonts.medium,
      labelMedium: AppFonts.bold,
      labelLarge: AppFonts.mainButtonsFont,
      displayLarge: AppFonts.headLine,
      displayMedium: AppFonts.semiBold),

  // Define other theme properties as needed
);

abstract class AppFonts {
  static final headLine = GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.01,
  );
  static final mainButtonsFont = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      letterSpacing: -0.004);
  static final semiBold = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: -0.004);
  static final medium = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      letterSpacing: -0.004);
  static final bold = GoogleFonts.urbanist(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: -0.004);
}
