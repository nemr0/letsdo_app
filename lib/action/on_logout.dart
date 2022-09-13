import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/welcome.dart';

logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(WelcomeTwoScreen.id, (r) => false));
}
