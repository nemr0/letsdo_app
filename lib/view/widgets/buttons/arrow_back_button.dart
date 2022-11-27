import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/login_signup_forgot_controllers.dart';
import 'package:letsdo_app/view/screens/welcome.dart';

import '../../../constants.dart';

class ArrowBackButton extends ConsumerWidget {
  final Provider<GlobalKey<FormState>> formKey;
  const ArrowBackButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        margin: EdgeInsets.only(left: width * .1),
        decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return IconButton(
              onPressed: () {
                ref.read(formKey).currentState?.reset();
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const WelcomeTwoScreen(),
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: (_, anim, __, child) =>
                        FadeTransition(opacity: anim, child: child),
                  ),
                );
              },
              color: Colors.transparent,
              splashRadius: 25,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ));
        }),
      ),
    );
  }
}
