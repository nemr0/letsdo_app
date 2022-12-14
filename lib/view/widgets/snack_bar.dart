import 'package:flutter/material.dart';

import '../../constants.dart';

SnackBar snackBar(bool isSuccess, String text, BuildContext context,
        {Duration? duration}) =>
    SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 180,
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 40, maxHeight: 70),
        child: Container(
          alignment: AlignmentDirectional.centerEnd,
          width: double.infinity * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                colors: (!isSuccess)
                    ? [
                        blackColor.withOpacity(.7),
                        Colors.redAccent.withOpacity(.7)
                      ]
                    : [
                        blackColor.withOpacity(.7),
                        Colors.greenAccent.withOpacity(.7)
                      ]),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Icon(
                (isSuccess) ? Icons.check_circle : Icons.cancel,
                color: whiteColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: whiteColor),
                  softWrap: true,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      duration: duration ?? const Duration(seconds: 4),
    );
