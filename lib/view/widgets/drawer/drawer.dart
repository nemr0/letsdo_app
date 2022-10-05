import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:letsdo_app/constants.dart';
import 'package:letsdo_app/view/screens/today/today_view.dart';
import 'package:random_avatar/random_avatar.dart';

import 'drawer_tile.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      )),
      child: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                  child: randomAvatar(
                    FirebaseAuth.instance.currentUser?.uid ?? 'Stranger',
                    height: 100,
                    width: 100,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Text(
                    FirebaseAuth.instance.currentUser?.displayName ??
                        'Stranger',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FirebaseAuth.instance.currentUser?.email ??
                            'stranger@letsdo.app',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 12,
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/edit-icon.png',
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: greyColor.withOpacity(.3),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerTile(
                    text: 'Today',
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(TodayScreen.id);
                    }),
                DrawerTile(
                  text: 'Important',
                  onTap: () {},
                ),
                DrawerTile(
                  text: 'Calendar',
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Account',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Logout',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: redColor),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
