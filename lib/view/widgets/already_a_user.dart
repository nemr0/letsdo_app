import 'package:flutter/material.dart';

class AlreadyAUser extends StatelessWidget {
  const AlreadyAUser({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
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
          TextButton(
            key: key,
            onPressed: onPressed,
            child: Text(
              'LOG IN',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
