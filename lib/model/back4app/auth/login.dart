import 'package:flutter/material.dart';
import 'package:letsdo_app/constants.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Auth {
  Future<ParseResponse> register(
      {required String? email,
      required String? password,
      required String? username}) async {
    final user = ParseUser(username, password, email);
    ParseResponse response = await user.create();
    return response;
  }

  Future<ParseResponse> verifyEmail(String emailOrUsername) async {
    bool isEmail = isEmailOrNot(emailOrUsername);
    return await ParseUser(isEmail ? null : emailOrUsername, null,
            isEmail ? emailOrUsername : null)
        .verificationEmailRequest();
  }

  Future<ParseResponse?> login(
      {required String emailOrUsername, required String password}) async {
    bool isEmail = isEmailOrNot(emailOrUsername);
    ParseUser? user;
    user = (isEmail)
        ? ParseUser(null, password, emailOrUsername)
        : ParseUser(emailOrUsername, password, null);
    return await user.login();
  }
}

/// Checks if it's an email or username
bool isEmailOrNot(String emailOrUsername) {
  if (emailOrUsername.contains('@') && emailOrUsername.contains('.')) {
    return true;
  } else {
    return false;
  }
}
