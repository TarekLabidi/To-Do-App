import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnlineEdit {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> upDateName({required String name}) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('personalData')
        .doc('name')
        .update({'Username': name});
  }
}
