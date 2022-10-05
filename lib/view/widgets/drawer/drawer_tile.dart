import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const DrawerTile({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20),
      horizontalTitleGap: 0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${text.toLowerCase()}.png',
            width: 16,
            height: 16,
          ),
        ],
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
      ),
      onTap: onTap,
    );
  }
}
