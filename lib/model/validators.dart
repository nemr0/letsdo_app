import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:letsdo_app/model/is_username_or_email.dart';
import 'package:letsdo_app/view/handlers/animate_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'is_email_valid.dart';

/// validates username on register
String? validateUsername(String? username) =>
    (username == null || username.isEmpty || username.contains(' '))
        ? 'Please Enter A Correct Username'
        : (username.length < 3 || username.length > 12)
            ? 'Only 3 - 12 Characters Are Allowed'
            : null;

/// validates email on register
String? validateEmail(String? email) {
  if (email == null) return 'Please Enter Your Email';

  if (isEmailValid(email) == false) {
    return 'Please Enter An Correct Email';
  }
  return null;
}

/// Validates login email/username field
String? validateEmailOrUsername(String? emailOrUsername) {
  /// true for email, false for username and, null for neither.
  bool? isEmail = isEmailOrUsername(emailOrUsername);
  print(isEmail);

  ///if not email or username
  if (isEmail == null || emailOrUsername == null) {
    return 'Please Enter Your Email/Username';
  }
  return null;
}

/// Validates login/register password field
String? validatePwd(String? pwd) => (pwd == null || pwd.isEmpty)
    ? 'Please Enter A Password'
    : (pwd.length < 4)
        ? 'Please Enter 4 or more characters'
        : null;

/// Validates Form of register/login/forgot-password pages And Gives error if not valid
bool validate(WidgetRef ref, Provider<GlobalKey<FormState>> formKey,
    AutoDisposeProvider<RoundedLoadingButtonController> ctr) {
  final bool? isValidated = ref.read(formKey).currentState?.validate();
  if (isValidated == null || !isValidated) {
    animateFailureBtn(btn: ctr, ref: ref);
    return false;
  } else {
    return true;
  }
}
