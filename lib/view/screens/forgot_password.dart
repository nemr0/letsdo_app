import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/view/widgets/snackbars.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../controller/login_signup_controllers.dart';
import '../../model/back4app/auth/login.dart';
import '../widgets/buttons/arrow_back_button.dart';
import '../widgets/buttons/button.dart';
import '../widgets/custom_textfield.dart';

final forgotBtnController = Provider((ref) => RoundedLoadingButtonController());

class ForgotScreen extends ConsumerWidget {
  const ForgotScreen({Key? key}) : super(key: key);
  static const id = '/forgot';
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
                  child: RichText(
                    text: TextSpan(
                        text: 'Hello!\n',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                        children: [
                          TextSpan(
                            text:
                                'Please enter a username or email\nto send an email verification request',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ]),
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
            ),
            const Spacer(
              flex: 3,
            ),
            Button(
                btnMode: ButtonMode.full,
                onPressed: () async {
                  ParseResponse response = await Auth()
                      .verifyEmail(ref.read(usernameControllerProvider).text);
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(snkbr(
                        response.success,
                        response.success
                            ? 'Successfully Sent Request, Check Your Mail! :)'
                            : (response.error?.message)!,
                        context));
                  });
                  final ctr = ref.read(forgotBtnController);
                  response.success ? ctr.success() : ctr.error();
                  await Future.delayed(const Duration(seconds: 1));
                  ctr.reset();
                },
                controller: ref.watch(forgotBtnController),
                text: 'Send Request',
                animateOnTap: true),
            const Spacer(
              flex: 11,
            ),
          ],
        ),
      ),
    );
  }
}
