import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.isSearch = false,
    this.onSubmitted,
    this.validator,
    this.textInputAction = TextInputAction.next,
    required this.name,
    this.isObscure = false,
  }) : super(key: key);
  final bool isSearch;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String name;
  final bool isObscure;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final isVisible = useState(true);
    return Hero(
      tag: name.toLowerCase(),
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
            width: width * .8,
            child: TextFormField(
              validator: validator,
              controller: controller,
              onFieldSubmitted: onSubmitted,
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
