import 'package:cloud_firestore/cloud_firestore.dart';

class FBRef {
  static DocumentReference<Map<String, dynamic>> user(String uid) =>
      FirebaseFirestore.instance.collection('Users').doc(uid);

  Query<Map<String, dynamic>> usernameToEmail(String username) =>
      FirebaseFirestore.instance
          .collection('Users')
          .where('username', isEqualTo: username);
}
