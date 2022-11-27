import 'is_email_valid.dart';

bool? isEmailOrUsername(String? emailOrUsername) {
  if (emailOrUsername == null) {
    return null;
  }
  final bool emailValid = isEmailValid(emailOrUsername);
  if (emailValid) {
    return true;
  } else {
    return false;
  }
}
