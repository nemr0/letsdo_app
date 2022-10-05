import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/firebase/auth.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';

import '../model/validators.dart';
import '../view/screens/home/home_body.dart';
import '../view/widgets/snackbars.dart';

onSignUp(BuildContext context, WidgetRef ref) async {
  /// Checks Connection using Connectivity Package
  final bool isConnected = await Connectivity().checkConnection();

  /// Button Controller
  // if no connection shows error and returns
  if (!isConnected) {
    animateFailureBtn(btn: registerBtnController, read: ref.read);
    return;
  }

  /// User Name from Controller
  final String name = ref.read(nameControllerProvider).text;

  /// Email from Controller
  final String email = ref.read(emailControllerProvider).text;

  /// Password from Controller
  final String pwd = ref.read(pwdControllerProvider).text;

  /// Triggers Validate Form Action and shows error on not valid
  final bool isValidated =
      await validate(ref.read, registerFormKey, registerBtnController);
  // returns if not valid
  if (!isValidated) return;

  /// Error log for Register func, if null there's no error
  String? e;
  // Triggering Firebase to Register
  await Auth()
      .register(email, pwd, name)
      .onError((error, stackTrace) => e = error.toString());
  // show snack bar with results and trigger success or fail animation
  // if there's no error
  if (e == null) {
    await Future.delayed(
        Duration.zero,
        () => ScaffoldMessenger.of(context).showSnackBar(snkbr(
            true, 'Welcome, ${name.isEmpty ? 'Stranger' : name}!', context)));
    animateSuccessBtn(btn: registerBtnController, read: ref.read);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false));
  } else {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        ScaffoldMessenger.of(context).showSnackBar(snkbr(false, e!, context)));
    animateFailureBtn(btn: registerBtnController, read: ref.read);
  }
}
