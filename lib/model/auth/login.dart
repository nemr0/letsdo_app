import 'package:flutter/material.dart';
import 'package:letsdo_app/constants.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<ParseResponse> login(String email, String password, context) async {
  ParseResponse response = await ParseUser('', password, email).create();

  await Future.delayed(Duration.zero, () {
    ScaffoldMessenger.of(context).showSnackBar(
      snkbr(
          response.success,
          response.success
              ? response.results.toString()
              : (response.error?.message)!.toUpperCase(),
          context),
    );
  });
  return response;
}

SnackBar snkbr(bool isSuccess, String text, BuildContext context,
    {Duration? duration}) {
  return SnackBar(
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
                  ? [blackColor, Colors.redAccent]
                  : [blackColor, Colors.greenAccent]),
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
}
