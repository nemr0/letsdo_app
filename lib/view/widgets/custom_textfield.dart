import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    Key? key,
    this.onSubmitted,
    required this.width,
    this.textInputAction = TextInputAction.next,
    required this.name,
    this.isObscure = false,
  }) : super(key: key);
  final TextInputAction textInputAction;
  final double width;
  final String name;
  final bool isObscure;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    final isVisible = useState(true);
    return Hero(
      tag: name,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
            width: width * .8,
            child: TextField(
              onSubmitted: onSubmitted,
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
                            color: isVisible.value
                                ? blackColor
                                : Colors.blueAccent,
                          ))
                      : null),
            )),
      ),
    );
  }
}