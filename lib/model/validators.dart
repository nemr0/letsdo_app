import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

String? validateEmail(String? email) {
  if (email == null) return 'Please Enter Your Email';
  if (!(email.contains('@')) && !(email.contains('.'))) {
    return 'Please Enter An Correct Email';
  }
  return null;
}

String? validateUsernameOrEmail(String? emailOrUsername) =>
    (emailOrUsername == null || emailOrUsername.isEmpty)
        ? 'Please Enter An Email or Username'
        : null;
String? validatePwd(String? pwd) =>
    (pwd == null || pwd.isEmpty) ? 'Please Enter A Password' : null;
Future<bool> validate(WidgetRef ref, Provider<GlobalKey<FormState>> formKey,
    RoundedLoadingButtonController ctr) async {
  final bool? isValidated = ref.read(formKey).currentState?.validate();

  if (isValidated == null || !isValidated) {
    ctr.error();
    await Future.delayed(const Duration(milliseconds: 700));
    ctr.reset();
    return false;
  } else {
    return true;
  }
}
