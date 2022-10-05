import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/action/on_signup.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/model/validators.dart';
import 'package:letsdo_app/view/widgets/buttons/button.dart';

import '../widgets/already_a_user.dart';
import '../widgets/buttons/arrow_back_button.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) => Form(
            key: ref.watch(registerFormKey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                ArrowBackButton(
                  formKey: registerFormKey,
                ),
                const Spacer(),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * .1),
                      child: Text(
                        'Hello!\nSignup to\nGet Started',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    )),
                const Spacer(
                  flex: 2,
                ),
                CustomTextField(
                  controller: ref.watch(nameControllerProvider),
                  tag: 'name',
                  width: width,
                  name: 'Username',
                  validator: (s) => s == null || s.isEmpty || s.contains(' ')
                      ? 'Please Enter A Correct Username'
                      : (s.length < 4)
                          ? 'At Least 4 Characters Are Allowed'
                          : null,
                ),
                const Spacer(),
                CustomTextField(
                  controller: ref.watch(emailControllerProvider),
                  tag: 'email',
                  width: width,
                  name: 'Email',
                  validator: validateEmail,
                ),
                const Spacer(),
                CustomTextField(
                  controller: ref.watch(pwdControllerProvider),
                  tag: 'password',
                  width: width,
                  name: 'Password',
                  isObscure: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (s) {
                    ref.read(registerBtnController).start();
                    onSignUp(context, ref);
                  },
                  validator: validatePwd,
                ),
                const Spacer(
                  flex: 2,
                ),
                Button(
                    btnMode: ButtonMode.full,
                    onPressed: () => onSignUp(context, ref),
                    controller: ref.watch(registerBtnController),
                    text: 'Sign Up',
                    animateOnTap: true),
                const AlreadyAUser(
                  isWelcome: false,
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
