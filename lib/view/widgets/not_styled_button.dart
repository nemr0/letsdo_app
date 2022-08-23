import 'package:flutter/material.dart';

class NotStyledButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const NotStyledButton({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
