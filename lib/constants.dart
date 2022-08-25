import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(143, 136, 207, 1);
const Color primaryShadeColor = Color.fromRGBO(231, 230, 244, 1);
const Color whiteColor = Color.fromRGBO(253, 253, 253, 1);
const Color blackColor = Color.fromRGBO(39, 42, 51, 1);
const Color greyColor = Color.fromRGBO(145, 147, 152, 1);
const Color primaryTextColor = Color.fromRGBO(112, 104, 148, 1);
const Color errorLightColor = Color.fromRGBO(229, 157, 155, 1);
const ColorScheme lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryTextColor,
  secondary: primaryShadeColor,
  onSecondary: blackColor,
  error: errorLightColor,
  onError: Colors.redAccent,
  background: whiteColor,
  onBackground: blackColor,
  surface: greyColor,
  onSurface: Colors.black,
);
const ColorScheme darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryTextColor,
  onPrimary: primaryShadeColor,
  secondary: primaryColor,
  onSecondary: whiteColor,
  error: Colors.redAccent,
  onError: errorLightColor,
  background: blackColor,
  onBackground: whiteColor,
  surface: greyColor,
  onSurface: Colors.white,
);
