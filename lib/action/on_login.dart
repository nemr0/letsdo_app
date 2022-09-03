import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/back4app/auth/login_model.dart';
import 'package:letsdo_app/model/validators.dart';
import 'package:letsdo_app/view/screens/home.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../view/widgets/snackbars.dart';

onLogin(BuildContext context, WidgetRef ref) async {
  final ctr = ref.read(loginBtnController);
  final String emailOrUsername = ref.read(usernameControllerProvider).text;
  final String pwd = ref.read(pwdControllerProvider).text;
  final bool isValidated = await validate(ref, loginFormKey, ctr);
  if (!isValidated) return;

  ParseResponse response =
      await login(emailOrUsername: emailOrUsername, password: pwd);

  if (response.success) {
    await Future.delayed(
        Duration.zero,
        () => ScaffoldMessenger.of(context)
            .showSnackBar(snkbr(true, 'Welcome!}', context)));
    ctr.success();

    await Future.delayed(const Duration(seconds: 1));
    ctr.reset();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false));
  } else {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(snkbr(false, (response.error?.message)!, context)));
    ctr.error();
    await Future.delayed(const Duration(seconds: 1));
    ctr.reset();
  }
}
