import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsdo_app/model/firebase/ref.dart';

class FBGet {
  email(String username) async {
    try {
      var data = await FBRef().usernameToEmail(username).get();
      data.docs.first.get('email');
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
