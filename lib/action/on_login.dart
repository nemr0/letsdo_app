import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/validators.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';
import 'package:letsdo_app/view/screens/home/home_body.dart';

import '../model/firebase/auth.dart';
import '../view/widgets/snack_bar.dart';

onLogin(BuildContext context, WidgetRef ref) async {
  /// Checks Connection using Connectivity Package
  final bool isConnected = await Connectivity().checkConnection();

  /// Button Controller
  // if no connection shows error and returns
  if (!isConnected) {
    animateFailureBtn(btn: loginBtnController, ref: ref);
    return;
  }

  /// Triggers Validate Form Action and shows error on not valid
  final bool isValidated = validate(ref, loginFormKey, loginBtnController);
  // returns if not valid
  if (!isValidated) return;

  /// Email from Controller
  final String emailOrUsername = ref.read(emailOrUsernameCtrProvider).text;

  /// Password from Controller
  final String pwd = ref.read(pwdControllerProvider).text;

  /// Error log for login func, if null there's no error
  String? e;
  // Triggering Firebase to login, returns user display name
  String? name = await Auth()
      .login(emailOrUsername, pwd)
      .onError((error, stackTrace) => e = error.toString());
  // show snack bar with results and trigger success or fail animation
  // if there's no error
  if (e == null) {
    // trigger button success animation
    await animateSuccessBtn(btn: loginBtnController, ref: ref);
    // Push [HomeScreen]
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false));
    // Show Success Msg
    Future.delayed(
      Duration.zero,
      () => ScaffoldMessenger.of(context).showSnackBar(
        snackBar(true, 'Welcome, ${name ?? 'Stranger'}!', context),
      ), // showSnackBar
    ); // addPostFrameCallback
  } else {
    // trigger button error animation
    animateFailureBtn(btn: loginBtnController, ref: ref);
    // Show Error Msg
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => ScaffoldMessenger.of(context).showSnackBar(
        snackBar(false, e!, context),
      ), //showSnackBar
    ); //addPostFrameCallback
  }
}
