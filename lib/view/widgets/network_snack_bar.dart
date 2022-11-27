import 'package:flutter/material.dart';

import '../../constants.dart';

networkSnackBar({
  bool isOffline = true,
  required double height,
}) =>
    SnackBar(
      margin: EdgeInsets.only(
        bottom: height - 180,
      ),
      dismissDirection: isOffline ? DismissDirection.none : DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 40,
        alignment: AlignmentDirectional.centerStart,
        width: double.infinity * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
              colors: isOffline
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
              (isOffline)
                  ? Icons.signal_cellular_connected_no_internet_4_bar_rounded
                  : Icons.signal_cellular_4_bar_rounded,
              color: whiteColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                isOffline ? 'Weak/No Internet Connection' : 'Back Online !',
                style: const TextStyle(
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
    );
