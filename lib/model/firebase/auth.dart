import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:letsdo_app/model/firebase/get.dart';
import 'package:letsdo_app/model/is_username_or_email.dart';

class Auth {
  Future<String?> login(String emailOrUsername, String pwd) async {
    bool? isEmail = isEmailOrUsername(emailOrUsername);
    if (kDebugMode) print(emailOrUsername);
    String? email = emailOrUsername;
    try {
      if (isEmail == false) {
        email = await FBGet().email(emailOrUsername);
        if (email == null) return Future.error('Username does not exist');
      }

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? 'unknown-error');
    }
    return FirebaseAuth.instance.currentUser?.displayName;
  }

  Future<void> register(String email, String pwd) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pwd);
      await auth.signInWithEmailAndPassword(email: email, password: pwd);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? 'unknown.error');
    }
  }

  // Fires immediately after register or on username update
  Future<void> saveUsername(String username) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return Future.error('No User Exists');
    try {
      await user.updateDisplayName(username);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({'email': user.email, 'username': username});
    } on FirebaseException catch (e) {
      return Future.error(e.message ?? 'unknown.error');
    }
  }

  Future sendForgotEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? 'unknown-error');
    }
  }
}
