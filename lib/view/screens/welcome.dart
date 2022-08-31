import 'package:flutter/material.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import '../../constants.dart';
import '../handlers/handle_statusbar_brightness.dart';
import '../widgets/already_a_user.dart';
import '../widgets/buttons/button.dart';

class WelcomeOneScreen extends StatelessWidget {
  static const String id = '/welcome1';

  const WelcomeOneScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleStatusBarBrightness(context);
    return Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/logo.png'),
            RichText(
              text: TextSpan(
                  text: 'Hi! Welcome To',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: whiteColor),
                  children: [
                    TextSpan(
                        text: '\nLet\'s Do',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: whiteColor)),
                    TextSpan(
                        text:
                            '\n\nExplore the app, Let\'s make to-do\n list with Let\'s Do',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: whiteColor))
                  ]),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/w1.png'),
            Button(
              text: 'Get Started',
              btnMode: ButtonMode.start,
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(WelcomeTwoScreen.id, (r) => false);
              },
              animateOnTap: false,
            ),
          ],
        ));
  }
}

class WelcomeTwoScreen extends StatelessWidget {
  const WelcomeTwoScreen({Key? key}) : super(key: key);
  static const String id = '/welcome2';

  @override
  Widget build(BuildContext context) {
    handleStatusBarBrightness(context);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          'assets/logo.png',
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        const Spacer(),
        Image.asset('assets/w2.png'),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: 'What are what we do',
            style: Theme.of(context).textTheme.titleLarge,
            children: [
              TextSpan(
                text:
                    '\nThousands of people are using Let\'s Do \nfor make to do list for better\nproductivity',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Button(
          animateOnTap: false,
          text: 'Sign Up',
          btnMode: ButtonMode.full,
          onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
        ),
        const AlreadyAUser(
          isWelcome: true,
        ),
        const Spacer(),
      ],
    ));
  }
}
