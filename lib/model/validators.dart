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
