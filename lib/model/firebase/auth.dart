import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<String?> login(String email, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? 'unknown-error');
    }
    return FirebaseAuth.instance.currentUser?.displayName;
  }

  Future<void> register(String email, String pwd, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);

      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({'email': email, 'username': name});
    } on FirebaseAuthException catch (e) {
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
