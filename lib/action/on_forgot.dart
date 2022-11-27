import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/model/firebase/auth.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';

import '../controller/login_signup_forgot_controllers.dart';
import '../model/validators.dart';
import '../view/widgets/snack_bar.dart';

/// On Forgot Button Pressed
onForgot(BuildContext context, WidgetRef ref) async {
  /// Triggers Validate Form Action and shows error on not valid
  final bool isValidated = validate(ref, forgotFormKey, forgotBtnController);
  // returns if not valid
  if (!isValidated) return;

  /// Checks Connection using Connectivity Package
  final bool isConnected = await Connectivity().checkConnection();

  // if no connection shows error and returns
  if (!isConnected) {
    animateFailureBtn(btn: forgotBtnController, ref: ref);
    return;
  }

  /// Email from Controller
  final email = ref.read(emailOrUsernameCtrProvider).text;

  /// Error for send forgot email func, if null there's no error
  String? err;
  // Triggering Firebase to send reset email
  await Auth()
      .sendForgotEmail(email)
      .onError((error, stackTrace) => err = error.toString());

  // show snack bar with results and trigger success or fail animation
  // if there's no error
  if (err == null) {
    // trigger button success animation
    await animateSuccessBtn(btn: forgotBtnController, ref: ref);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        ScaffoldMessenger.of(context).showSnackBar(snackBar(
            true, 'Successfully Sent Request, Check Your Mail! :)', context)));

    // pop current context
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => Navigator.pop(context));
  } else {
    // trigger button error animation
    animateFailureBtn(btn: forgotBtnController, ref: ref);
    // Show Error msg
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => ScaffoldMessenger.of(context).showSnackBar(
        snackBar(false, err.toString(), context),
      ),
    );
  }
}
