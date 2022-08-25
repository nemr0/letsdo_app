import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:letsdo_app/constants.dart';
import 'package:letsdo_app/view/widgets/button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/already_a_user.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

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
            const BackButton(),
            const Spacer(),
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsets.only(left: width * .1),
                  child: Text(
                    'Hello!\nSignup to\nGet Started',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                )),
            const Spacer(
              flex: 2,
            ),
            CustomTextField(
              width: width,
              name: 'Name',
            ),
            const Spacer(),
            CustomTextField(
              width: width,
              name: 'Email',
            ),
            const Spacer(),
            CustomTextField(
              width: width,
              name: 'Password',
              isObscure: true,
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
            AlreadyAUser(
              onPressed: () {},
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

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        margin: EdgeInsets.only(left: width * .1),
        decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.transparent,
            splashRadius: 25,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
            )),
      ),
    );
  }
}

class CustomTextField extends HookWidget {
  const CustomTextField({
    Key? key,
    required this.width,
    required this.name,
    this.isObscure = false,
  }) : super(key: key);

  final double width;
  final String name;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    final isVisible = useState(true);
    return SizedBox(
        width: width * .8,
        child: TextField(
          obscureText: isObscure ? isVisible.value : false,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              hintText: name,
              suffixIcon: isObscure
                  ? IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        isVisible.value = !isVisible.value;
                      },
                      icon: ImageIcon(
                        const AssetImage(
                          'assets/suffix_icon.png',
                        ),
                        color: isVisible.value ? blackColor : Colors.blueAccent,
                      ))
                  : null),
        ));
  }
}
