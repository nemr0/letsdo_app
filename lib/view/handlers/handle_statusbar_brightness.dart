import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

handleStatusBarBrightness(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Theme.of(context).brightness,
    statusBarBrightness: Theme.of(context).brightness,
  ));
}
