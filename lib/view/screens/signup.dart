import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_controllers.dart';
import 'package:letsdo_app/view/widgets/buttons/button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/already_a_user.dart';
import '../widgets/buttons/arrow_back_button.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends ConsumerWidget {
  static const String id = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            const ArrowBackButton(),
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
              controller: ref.watch(usernameControllerProvider),
              tag: 'username',
              width: width,
              name: 'Username',
            ),
            const Spacer(),
            CustomTextField(
              controller: ref.watch(emailControllerProvider),
              tag: 'email',
              width: width,
              name: 'Email',
            ),
            const Spacer(),
            CustomTextField(
              controller: ref.watch(pwdControllerProvider),
              tag: 'password',
              width: width,
              name: 'Password',
              isObscure: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (s) {},
            ),
            const Spacer(
              flex: 2,
            ),
            Button(
                btnMode: ButtonMode.full,
                onPressed: () {},
                controller: RoundedLoadingButtonController(),
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
    );
  }
}
