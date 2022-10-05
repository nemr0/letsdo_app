import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/validators.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';
import 'package:letsdo_app/view/screens/home/home_body.dart';

import '../model/firebase/auth.dart';
import '../view/widgets/snackbars.dart';

onLogin(BuildContext context, WidgetRef ref) async {
  /// Checks Connection using Connectivity Package
  final bool isConnected = await Connectivity().checkConnection();

  /// Button Controller
  // if no connection shows error and returns
  if (!isConnected) {
    animateFailureBtn(btn: loginBtnController, read: ref.read);
    return;
  }

  /// Triggers Validate Form Action and shows error on not valid
  final bool isValidated =
      await validate(ref.read, loginFormKey, loginBtnController);
  // returns if not valid
  if (!isValidated) return;

  /// Email from Controller
  final String email = ref.read(emailControllerProvider).text;

  /// Password from Controller
  final String pwd = ref.read(pwdControllerProvider).text;

  /// Error log for login func, if null there's no error
  String? e;
  // Triggering Firebase to login, returns user display name
  String? name = await Auth()
      .login(email, pwd)
      .onError((error, stackTrace) => e = error.toString());
  // show snack bar with results and trigger success or fail animation
  // if there's no error
  if (e == null) {
    // trigger button success animation
    animateSuccessBtn(btn: loginBtnController, read: ref.read);
    // Push [HomeScreen]
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false));
    // Show Success Msg
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => ScaffoldMessenger.of(context).showSnackBar(
        snkbr(true, 'Welcome, ${name ?? 'Stranger'}!', context),
      ), // showSnackBar
    ); // addPostFrameCallback
  } else {
    // trigger button error animation
    animateFailureBtn(btn: loginBtnController, read: ref.read);
    // Show Error Msg
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => ScaffoldMessenger.of(context).showSnackBar(
        snkbr(false, e!, context),
      ), //showSnackBar
    ); //addPostFrameCallback
  }
}
