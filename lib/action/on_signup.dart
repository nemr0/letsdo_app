import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/back4app/auth/register_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import '../model/validators.dart';
import '../view/screens/home.dart';
import '../view/widgets/snackbars.dart';

onSignUp(BuildContext context, WidgetRef ref) async {
  final bool isConnected = await Connectivity().checkConnection();
  if (!isConnected) return;
  final ctr = ref.read(registerBtnController);
  final String username = ref.read(usernameControllerProvider).text;
  final String email = ref.read(emailControllerProvider).text;
  final String pwd = ref.read(pwdControllerProvider).text;
  final bool isValidated = await validate(ref, registerFormKey, ctr);
  if (!isValidated) return;

  ParseResponse response =
      await register(email: email, password: pwd, username: username);

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
