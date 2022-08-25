import 'package:flutter/material.dart';

import '../../../constants.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
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
