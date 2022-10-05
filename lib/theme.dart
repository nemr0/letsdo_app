import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsdo_app/constants.dart';

class ThemeOfLetsDo {
  static ThemeData lightTheme() => ThemeData(
        colorScheme: lightScheme,
        errorColor: errorLightColor,
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: primaryColor, fontSize: 17),
            fillColor: primaryShadeColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            )),
        scaffoldBackgroundColor: whiteColor,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontSize: 42,
              color: blackColor,
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
          titleSmall: TextStyle(fontSize: 12, color: greyColor, wordSpacing: 3),
          bodyLarge:
              TextStyle(fontSize: 16, color: primaryTextColor, wordSpacing: 3),
          bodyMedium:
              TextStyle(fontSize: 16, color: primaryTextColor, wordSpacing: 3),
          bodySmall: TextStyle(fontSize: 14, color: greyColor, wordSpacing: 3),
        ),
        fontFamily: GoogleFonts.rubik().fontFamily,
      );

  static ThemeData darkTheme() => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white, selectionColor: primaryColor),
        colorScheme: darkScheme,
        errorColor: Colors.redAccent,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: primaryColor, fontSize: 17),
          fillColor: primaryTextColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        scaffoldBackgroundColor: blackColor,
        brightness: Brightness.dark,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          labelLarge: TextStyle(
              fontFamily: GoogleFonts.rubik().fontFamily,
              fontSize: 42,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelMedium: TextStyle(
              fontFamily: GoogleFonts.rubik().fontFamily,
              fontSize: 24,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 3),
          labelSmall: const TextStyle(
              fontSize: 14, color: primaryColor, wordSpacing: 3),
          titleLarge:
              const TextStyle(fontSize: 20, color: whiteColor, wordSpacing: 3),
          titleSmall:
              const TextStyle(fontSize: 12, color: greyColor, wordSpacing: 3),
          bodyLarge:
              const TextStyle(fontSize: 16, color: whiteColor, wordSpacing: 3),
          bodyMedium:
              const TextStyle(fontSize: 14, color: whiteColor, wordSpacing: 3),
          bodySmall:
              const TextStyle(fontSize: 14, color: greyColor, wordSpacing: 3),
        ),
        fontFamily: GoogleFonts.rubik().fontFamily,
      );
}
