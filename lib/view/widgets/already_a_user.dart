import 'package:flutter/material.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/widgets/buttons/not_styled_button.dart';

class AlreadyAUser extends StatelessWidget {
  const AlreadyAUser({
    Key? key,
  }) : super(key: key);
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
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'LOG IN'),
        ],
      ),
    );
  }
}
