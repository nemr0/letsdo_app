import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';

import '../controller/login_signup_forgot_controllers.dart';
import '../model/validators.dart';
import '../view/widgets/snackbars.dart';

onForgot(BuildContext context, WidgetRef ref) async {
  final bool isConnected = await Connectivity().checkConnection();
  if (!isConnected) return;
  final ctr = ref.read(forgotBtnController);
  final bool isValidated = await validate(ref, forgotFormKey, ctr);
  if (!isValidated) return;
  ParseUser user =
      ParseUser(null, null, ref.read(usernameControllerProvider).text);
  ParseResponse response = await user.requestPasswordReset();
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    ScaffoldMessenger.of(context).showSnackBar(snkbr(
        response.success,
        response.success
            ? 'Successfully Sent Request, Check Your Mail! :)'
            : (response.error?.message)!,
        context));
  });
  response.success ? ctr.success() : ctr.error();
  await Future.delayed(const Duration(seconds: 1));
  ctr.reset();
}
