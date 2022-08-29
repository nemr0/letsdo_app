import 'package:flutter/material.dart';

class NotStyledButton extends StatelessWidget {
  const NotStyledButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.isHero = true})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final bool isHero;
  @override
  Widget build(BuildContext context) {
    return isHero
        ? Hero(
            tag: 'not-styled-button',
            child: SizedBox(
              width: 100,
              child: TextButton(
                key: key,
                onPressed: onPressed,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          )
        : TextButton(
            key: key,
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
  }
}
