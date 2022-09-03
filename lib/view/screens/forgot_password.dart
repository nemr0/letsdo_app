import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/model/validators.dart';
import '../../action/on_forgot.dart';
import '../../controller/login_signup_forgot_controllers.dart';
import '../widgets/buttons/arrow_back_button.dart';
import '../widgets/buttons/button.dart';
import '../widgets/custom_textfield.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);
  static const id = '/forgot';
  @override
  Widget build(
    BuildContext context,
  ) {
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
            ArrowBackButton(
              formKey: forgotFormKey,
            ),
            const Spacer(),
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsets.only(left: width * .1),
                  child: RichText(
                    text: TextSpan(
                        text: 'Hello!\n',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                        children: [
                          TextSpan(
                            text:
                                'Please enter your email\n to send a reset request',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ]),
                  ),
                )),
            const Spacer(
              flex: 3,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Form(
                key: ref.watch(forgotFormKey),
                child: CustomTextField(
                  controller: ref.watch(usernameControllerProvider),
                  tag: 'username',
                  width: width,
                  name: 'Email',
                  validator: validateEmail,
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Button(
                      btnMode: ButtonMode.full,
                      onPressed: () => onForgot(context, ref),
                      controller: ref.watch(forgotBtnController),
                      text: 'Send Request',
                      animateOnTap: true),
            ),
            const Spacer(
              flex: 11,
            ),
          ],
        ),
      ),
    );
  }
}
