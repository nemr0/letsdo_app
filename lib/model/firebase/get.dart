import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsdo_app/model/firebase/ref.dart';

class FBGet {
  Future<String?> email(String username) async {
    try {
      var data = await FBRef().usernameToEmail(username).get();
      return data.docs.first.data()['email'];
    } on FirebaseException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  Future<bool> usernameExists(String username) async {
    try {
      var data = await FBRef().usernameToEmail(username).get();
      return data.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
