import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsdo_app/model/firebase/ref.dart';

class FBSet {
  username(String username) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return Future.error('There\'s no authenticated user!');
    try {
      await FBRef.user(uid).update({'username': username});
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
