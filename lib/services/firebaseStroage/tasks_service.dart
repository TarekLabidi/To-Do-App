import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/services/firebaseStroage/task_model.dart';

class OnlineStorage {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createTask(
      {required String title,
      required String taskGroup,
      required String category,
      required int priority,
      required String date,
      required String kind,
      required int icon}) async {
    print('created');
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    //create a task
    Task newtask = Task(
        title: title,
        category: category,
        taskGroup: taskGroup,
        isCompleted: false,
        priority: priority,
        date: date,
        icon: icon,
        kind: kind);
    print(date.substring(
      6,
    ));
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(date.substring(
          6,
        ))
        .collection(kind)
        .doc(title)
        .set(newtask.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(date.substring(
          6,
        ))
        .collection('All')
        .doc(title)
        .set(newtask.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('category')
        .doc(category)
        .collection('tasks')
        .doc(title)
        .set(newtask.toMap());
    final CollectionReference collectionReference = _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('category');

    await collectionReference.doc(category).set({
      'description': 'description',
    });
  }

  //get tasks
  Stream<List<Task>> getTasks(String kind, String date) {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(date)
        .collection(kind)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList(),
        );
  }

  Stream<List<String>> getGroupTasks() {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    print('entred');

    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('category')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  Future<int> getNumberOfTasks(String category) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    int documentCount = 0;

    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection("category")
        .doc(category)
        .collection('tasks')
        .get()
        .then((querySnapshot) {
      documentCount = querySnapshot.size;
    });
    return documentCount;
  }

  Future createName({required String name}) async {
    final String currentUser = _firebaseAuth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(currentUser)
        .collection('personalData')
        .doc('name')
        .set({'Username': name});
  }

  Stream<bool> isNamePresentStream() {
    final String currentUser = _firebaseAuth.currentUser!.uid;
    final docRef = _firestore
        .collection('users')
        .doc(currentUser)
        .collection('personalData')
        .doc('name');

    return docRef.snapshots().map((snapshot) => snapshot.exists);
  }

  Future<Map<String, dynamic>> getName() async {
    final String currentUser = _firebaseAuth.currentUser!.uid;
    final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('users')
        .doc(currentUser)
        .collection('personalData')
        .doc('name')
        .get();

    return snapshot.data() ?? {};
  }
}
