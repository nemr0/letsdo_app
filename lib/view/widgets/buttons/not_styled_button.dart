import 'package:flutter/material.dart';

class NotStyledButton extends StatelessWidget {
  const NotStyledButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'not-styled-button',
      child: TextButton(
        key: key,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
