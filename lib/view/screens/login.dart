import 'package:flutter/material.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/widgets/buttons/arrow_back_button.dart';
import 'package:letsdo_app/view/widgets/buttons/not_styled_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/already_a_user.dart';
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
                    'Hello Again!\nWelcome\nBack',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )),
            const Spacer(
              flex: 3,
            ),
            CustomTextField(
              width: width,
              name: 'Email',
            ),
            const Spacer(),
            CustomTextField(
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
                text: 'LOGIN',
                animateOnTap: true),
            const Spacer(
              flex: 9,
            ),
            NotStyledButton(
                onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
                text: 'SIGN UP'),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
