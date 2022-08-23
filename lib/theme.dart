import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsdo_app/constants.dart';

class ThemeOfLetsDo {
  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: whiteColor,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontSize: 36,
              color: primaryTextColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelMedium: TextStyle(
              fontSize: 24,
              color: primaryTextColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelSmall:
              TextStyle(fontSize: 14, color: primaryTextColor, wordSpacing: 3),
          titleLarge: TextStyle(
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          titleMedium:
              TextStyle(fontSize: 20, color: primaryTextColor, wordSpacing: 3),
          bodyLarge:
              TextStyle(fontSize: 16, color: primaryTextColor, wordSpacing: 3),
          bodyMedium:
              TextStyle(fontSize: 16, color: primaryTextColor, wordSpacing: 3),
          bodySmall: TextStyle(fontSize: 14, color: greyColor, wordSpacing: 3),
        ),
        fontFamily: GoogleFonts.rubik().fontFamily,
      );

  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: blackColor,
        brightness: Brightness.dark,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontSize: 36,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelMedium: TextStyle(
              fontSize: 24,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelSmall:
              TextStyle(fontSize: 14, color: primaryColor, wordSpacing: 3),
          titleLarge:
              TextStyle(fontSize: 20, color: whiteColor, wordSpacing: 3),
          bodyLarge: TextStyle(fontSize: 16, color: whiteColor, wordSpacing: 3),
          bodyMedium:
              TextStyle(fontSize: 14, color: whiteColor, wordSpacing: 3),
          bodySmall: TextStyle(fontSize: 14, color: greyColor, wordSpacing: 3),
        ),
        fontFamily: GoogleFonts.rubik().fontFamily,
      );
}
