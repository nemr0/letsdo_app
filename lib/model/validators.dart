import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

String? validateEmail(String? email) {
  if (email == null) return 'Please Enter Your Email';
  if (!(email.contains('@')) && !(email.contains('.'))) {
    return 'Please Enter An Correct Email';
  }
  return null;
}

// String? validateName(String? emailOrUsername) =>
//     (emailOrUsername == null || emailOrUsername.isEmpty)
//         ? 'Please Enter An Email or Username'
//         : emailOrUsername.contains(' ')
//             ? null
//             : 'Please Enter Your Full Name';
String? validatePwd(String? pwd) =>
    (pwd == null || pwd.isEmpty) ? 'Please Enter A Password' : null;

/// Validates Form And Gives error if not valid
Future<bool> validate(Reader read, Provider<GlobalKey<FormState>> formKey,
    AutoDisposeProvider<RoundedLoadingButtonController> ctr) async {
  final bool? isValidated = read(formKey).currentState?.validate();
  if (isValidated == null || !isValidated) {
    animateFailureBtn(btn: ctr, read: read);
    return false;
  } else {
    return true;
  }
}
