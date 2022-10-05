import 'package:flutter/material.dart';

import '../../constants.dart';

PreferredSize buildAppBar(
  String text,
  BuildContext context,
) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .1),
    child: Center(
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leadingWidth: 100,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: primaryColor,
              size: 24,
            ),
          ),
        ),
        title: Text(text,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 24)),
      ),
    ),
  );
}
