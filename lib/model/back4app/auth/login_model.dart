import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// Future<ParseResponse> sendEmailVerf(String email) async {
//   return
// }

Future<ParseResponse> login(
    {required String emailOrUsername, required String password}) async {
  bool isEmail = isEmailOrNot(emailOrUsername);
  ParseUser? user;
  user = (isEmail)
      ? ParseUser(null, password, emailOrUsername)
      : ParseUser(emailOrUsername, password, null);
  return await user.login();
}

/// Checks if it's an email or username
bool isEmailOrNot(String emailOrUsername) {
  if (emailOrUsername.contains('@') && emailOrUsername.contains('.')) {
    return true;
  } else {
    return false;
  }
}
