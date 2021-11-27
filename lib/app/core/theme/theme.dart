import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  Themes._();

  static final Themes _instance = Themes._();

  factory Themes() => _instance;
  static final light = ThemeData(
    primaryColor: primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),
  );
  static final dark = ThemeData(
    primaryColor: Colors.teal,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkGreyClr,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: darkGreyClr,
    ),
  );
}

TextStyle get body2Style => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 18,
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
    ));
TextStyle get headingStyle => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
TextStyle get heading2Style => GoogleFonts.cabin(
        textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ));
TextStyle get subHeading2Style => GoogleFonts.cabin(
        textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ));
TextStyle get subHeadingStyle => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
TextStyle get titleStyle => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
TextStyle get subTitleStyle => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 14,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
TextStyle get bodyStyle => GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
