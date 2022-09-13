// imports
import 'package:flutter/material.dart';
import 'package:letsdo_app/constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

/// This enum describes the button shape and colors according to design structure
enum ButtonMode {
  /// Done Small Button
  done,

  /// Cancel Small Button
  cancel,

  ///Full Screen Button
  full,

  /// Get Started Button
  start
}

/// Button Widget
class Button extends StatelessWidget {
  final ButtonMode btnMode;
  final VoidCallback onPressed;
  final RoundedLoadingButtonController? controller;
  final String text;
  final bool animateOnTap;

  const Button(
      {Key? key,
      required this.btnMode,
      required this.onPressed,
      this.controller,
      required this.text,
      required this.animateOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'button',
      child: animateOnTap
          ? RoundedLoadingButton(
              onPressed: onPressed,
              color: btnMode == ButtonMode.start
                  ? isDark
                      ? blackColor
                      : whiteColor
                  : (btnMode == ButtonMode.cancel)
                      ? greyColor
                      : primaryColor,
              controller: controller ?? RoundedLoadingButtonController(),
              height: 60,
              width: width * .8,
              loaderStrokeWidth: 4,
              child: Text(
                text.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    letterSpacing: 3,
                    fontWeight: FontWeight.w100,
                    color: btnMode == ButtonMode.start
                        ? isDark
                            ? whiteColor
                            : primaryColor
                        : whiteColor),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: btnMode == ButtonMode.start
                    ? isDark
                        ? blackColor
                        : whiteColor
                    : (btnMode == ButtonMode.cancel)
                        ? greyColor
                        : primaryColor,
                fixedSize: Size(width * .8, 60),
              ),
              onPressed: onPressed,
              child: Text(
                text.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    letterSpacing: 3,
                    fontWeight: FontWeight.w100,
                    color: btnMode == ButtonMode.start
                        ? isDark
                            ? whiteColor
                            : primaryColor
                        : whiteColor),
              ),
            ),
    );
  }
}
