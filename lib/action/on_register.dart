import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/firebase/auth.dart';
import 'package:letsdo_app/model/firebase/get.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';

import '../model/validators.dart';
import '../view/screens/home/home_body.dart';
import '../view/widgets/snack_bar.dart';

onRegisterPressed(BuildContext context, WidgetRef ref) async {
  /// User Name from Controller
  final String name = ref.read(nameControllerProvider).text;

  /// Email from Controller
  final String email = ref.read(emailOrUsernameCtrProvider).text;

  /// Password from Controller
  final String pwd = ref.read(pwdControllerProvider).text;

  /// Triggers Validate Form Action and shows error on not valid
  final bool isValidated =
      validate(ref, registerFormKey, registerBtnController);
  // returns if not valid
  if (!isValidated) return;

  /// Checks Connection using Connectivity Package
  final bool isConnected = await Connectivity().checkConnection();

  /// Button Controller
  // if no connection shows error and returns
  if (!isConnected) {
    animateFailureBtn(btn: registerBtnController, ref: ref);
    return;
  }

  // Checking if username already exists.
  bool usernameExists = await FBGet().usernameExists(name);
  if (usernameExists) {
    animateFailureBtn(btn: registerBtnController, ref: ref);
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => ScaffoldMessenger.of(context).showSnackBar(
        snackBar(false, 'Username Already Exists, Please Choose Another One!',
            context),
      ),
    );
    return;
  }

  /// Error log for Register func, if null there's no error
  String? e;
  Auth auth = Auth();
  // Triggering Firebase to Register
  await auth
      .register(
        email,
        pwd,
      )
      .onError((error, stackTrace) => e = error.toString());
  await auth
      .saveUsername(name)
      .onError((error, stackTrace) => e = error.toString());
  // show snack bar with results and trigger success or fail animation
  // if there's no error
  if (e == null) {
    // Show True Msg Dialog
    await Future.delayed(
        Duration.zero,
        () => ScaffoldMessenger.of(context).showSnackBar(snackBar(
            true, 'Welcome, ${name.isEmpty ? 'Stranger' : name}!', context)));
    // Animate Success Button Animation
    await animateSuccessBtn(btn: registerBtnController, ref: ref);
    // Push Home Screen
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false));
  } else {
    // Show Error Msg Dialog
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar(false, e!, context)));
    // Animate Error Button Animation
    animateFailureBtn(btn: registerBtnController, ref: ref);
  }
}
