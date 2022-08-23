import 'package:flutter/material.dart';
import 'package:letsdo_app/view/widgets/not_styled_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../constants.dart';
import '../handlers/handle_statusbar_brightness.dart';
import '../widgets/button.dart';

class WelcomeOneScreen extends StatelessWidget {
  static const String id = '/w1';

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
              controller: RoundedLoadingButtonController(),
              text: 'Get Started',
              btnMode: ButtonMode.start,
              onPressed: () {
                Navigator.of(context).pushNamed(WelcomeTwoScreen.id);
              },
              animateOnTap: false,
            ),
          ],
        ));
  }
}

class WelcomeTwoScreen extends StatelessWidget {
  const WelcomeTwoScreen({Key? key}) : super(key: key);
  static const String id = '/w2';

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
          controller: RoundedLoadingButtonController(),
          text: 'Sign Up',
          btnMode: ButtonMode.full,
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ALREADY HAVE AN ACCOUNT?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              NotStyledButton(
                text: 'LOG IN',
                onTap: () {},
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
