import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/action/on_login.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/validators.dart';
import 'package:letsdo_app/view/screens/forgot_password.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/widgets/buttons/arrow_back_button.dart';
import 'package:letsdo_app/view/widgets/buttons/not_styled_button.dart';
import '../widgets/buttons/button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = '/login';
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) => Form(
            key: ref.watch(loginFormKey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                ArrowBackButton(
                  formKey: loginFormKey,
                ),
                const Spacer(),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * .1),
                      child: Text(
                        'Hello Again!\nWelcome\nBack',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    )),
                const Spacer(
                  flex: 3,
                ),
                CustomTextField(
                    controller: ref.watch(usernameControllerProvider),
                    tag: 'username',
                    width: width,
                    name: 'Username/Email',
                    validator: validateUsernameOrEmail),
                const Spacer(),
                CustomTextField(
                  controller: ref.watch(pwdControllerProvider),
                  tag: 'password',
                  width: width,
                  name: 'Password',
                  isObscure: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (s) => onLogin(context, ref),
                  validator: validatePwd,
                ),
                const Spacer(
                  flex: 2,
                ),
                Button(
                    btnMode: ButtonMode.full,
                    onPressed: () => onLogin(context, ref),
                    controller: ref.watch(loginBtnController),
                    text: 'LOGIN',
                    animateOnTap: true),
                const Spacer(
                  flex: 9,
                ),
                NotStyledButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, SignUpScreen.id),
                    text: 'SIGNUP'),
                NotStyledButton(
                  isHero: false,
                  onPressed: () =>
                      Navigator.pushNamed(context, ForgotScreen.id),
                  text: 'FORGOT PASSWORD',
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
