import 'package:flutter/material.dart';
import 'package:letsdo_app/view/widgets/buttons/not_styled_button.dart';

import '../screens/login.dart';

class AlreadyAUser extends StatelessWidget {
  const AlreadyAUser({
    Key? key,
    required this.isWelcome,
  }) : super(key: key);
  final bool isWelcome;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onPressed: () => isWelcome
                  ? Navigator.of(context).pushNamed(LoginScreen.id)
                  : Navigator.of(context).pushReplacementNamed(LoginScreen.id),
              text: 'LOG IN'),
        ],
      ),
    );
  }
}
