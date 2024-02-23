import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list_app/services/firebaseStroage/task_model.dart';

class OnlineStorage {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createTask(
      {required String title,
      required String desc,
      required String taskGroup,
      required String category,
      required String time,
      required String kind,
      required int priority}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    //create a task
    Task newtask = Task(
        title: title,
        desc: desc,
        category: category,
        taskGroup: taskGroup,
        time: time,
        isCompleted: false,
        priority: priority);

    await _firestore
        .collection('users')
        // .doc(currentUserId)
        .doc('7W9HnxuVvzPmzoqAbcoJ4lKcEXB2')
        .collection('Normal')
        .doc(title)
        .set(newtask.toMap());
  }

  //get tasks
  Stream<List<Task>> getTasks(String kind) {
    // final String currentUserId = _firebaseAuth.currentUser!.uid;
    print('ok');
    return _firestore
        .collection('users')
        .doc('7W9HnxuVvzPmzoqAbcoJ4lKcEXB2')
        // .doc(currentUserId)
        .collection(kind)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList(),
        );
  }
}
