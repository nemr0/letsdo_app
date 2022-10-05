import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letsdo_app/view/handlers/darken_lighten_color.dart';

import '../../../constants.dart';

class TodoListButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? color;
  const TodoListButton({
    Key? key,
    this.icon,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final altColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .049, vertical: 20),
      width: width * .4,
      height: width * .4,
      decoration: BoxDecoration(
          border: icon == null
              ? Border.all(color: primaryColor.withOpacity(.5), width: 3)
              : null,
          borderRadius: BorderRadius.circular(32),
          color: icon == null
              ? null
              : isLight
                  ? darken(color ?? altColor.withOpacity(.6), .4)
                  : lighten(color ?? altColor.withOpacity(.6), .35)),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {},
        child: Align(
          alignment: AlignmentDirectional.center,
          child: icon == null
              ? CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: width * .06,
                  // height: width * .1,
                  // width: width * .1,
                  // decoration:
                  //      BoxDecoration(shape: BoxShape.circle, color: whiteColor,),
                  child: Icon(
                    Icons.add,
                    color: primaryColor,
                    size: width * .08,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      radius: width * .06,
                      // height: width * .1,
                      // width: width * .1,
                      // decoration:
                      //      BoxDecoration(shape: BoxShape.circle, color: whiteColor,),
                      child: Icon(
                        icon,
                        color: isLight
                            ? darken(color ?? altColor)
                            : lighten(color ?? altColor),
                        size: width * .08,
                      ),
                    ),
                    if (text != null)
                      Text(
                        text!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
