import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/task_model.dart';

class OnlineUpDate {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> toggleIsDoneTask(
      {required String date,
      required String category,
      required String title}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map> snapshot = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(date.substring(
          6,
        ))
        .collection('To Do')
        .doc(title)
        .get();
    if (snapshot.exists) {
      bool isCompleted = snapshot.data()!['isCompleted'] ?? false;
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('days')
          .doc(date.substring(
            6,
          ))
          .collection('To Do')
          .doc(title)
          .update({'isCompleted': !isCompleted});
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('category')
          .doc(category)
          .collection('tasks')
          .doc(title)
          .update({'isCompleted': !isCompleted});
    }
  }

  Future<void> deleteTask({required Task task}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map> snapshot = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(task.date.substring(
          6,
        ))
        .collection('To Do')
        .doc(task.title)
        .get();
    if (snapshot.exists) {
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('days')
          .doc(task.date.substring(
            6,
          ))
          .collection('To Do')
          .doc(task.title)
          .delete();
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('category')
          .doc(task.category)
          .collection('tasks')
          .doc(task.title)
          .delete();
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('deleted Tasks')
          .doc(task.title)
          .set(task.toMap());
    }
  }

  Stream getTaskCompletionStatusStream(
      {required String date, required String title}) async* {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots = _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(date.substring(
          6,
        ))
        .collection('To Do')
        .doc(title)
        .snapshots();

    await for (DocumentSnapshot<Map<String, dynamic>> snapshot in snapshots) {
      if (snapshot.exists) {
        yield snapshot.data()!['isCompleted'];
      } else {
        yield false; // Document doesn't exist, consider it not completed
      }
    }
  }

  Future<void> addTaskAfterDeleting({required Task task}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('days')
        .doc(task.date.substring(
          6,
        ))
        .collection('To Do')
        .doc(task.title)
        .set(task.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('category')
        .doc(task.category)
        .collection('tasks')
        .doc(task.title)
        .set(task.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('deleted Tasks')
        .doc(task.title)
        .delete();
  }

  Future<void> toggleIsDoneHabitTask(
      {required HabbitTask habbitTask, required String day}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map> snapshot = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc('days')
        .collection(day)
        .doc(habbitTask.title)
        .get();
    if (snapshot.exists) {
      bool isCompleted = snapshot.data()!['isCompleted'];
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('Habits')
          .doc('days')
          .collection(day)
          .doc(habbitTask.title)
          .update({'isCompleted': !isCompleted});
    }
  }

  Stream getHabitTaskCompletionStatusStream(
      {required HabbitTask habbitTask, required String day}) async* {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots = _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc('days')
        .collection(day)
        .doc(habbitTask.title)
        .snapshots();

    await for (DocumentSnapshot<Map<String, dynamic>> snapshot in snapshots) {
      if (snapshot.exists) {
        yield snapshot.data()!['isCompleted'];
      } else {
        yield false; // Document doesn't exist, consider it not completed
      }
    }
  }

  Future<void> deleteHabitTaskFromTP(
      {required HabbitTask habbitTask, required String day}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc('days')
        .collection(day)
        .doc(habbitTask.title)
        .delete();
    final snapshots = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc(habbitTask.habit)
        .collection('tasks')
        .doc(habbitTask.habit)
        .get();
    List days = snapshots.data()!['days'];
    days.remove(day);
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc(habbitTask.habit)
        .collection('tasks')
        .doc(habbitTask.habit)
        .update({"days": days});
  }

  Future deleteGoalTask({required GoalTask goalTask}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc(goalTask.goal)
        .collection('tasks')
        .doc(goalTask.title)
        .delete();
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc('days')
        .collection(goalTask.date.substring(6))
        .doc(goalTask.title)
        .delete();
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('deleted Tasks')
        .doc(goalTask.title)
        .set(goalTask.toMap());
  }

  Future createGoalTask({required GoalTask goalTask}) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc(goalTask.goal)
        .collection('tasks')
        .doc(goalTask.title)
        .set(goalTask.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc('days')
        .collection(goalTask.date.substring(6))
        .doc(goalTask.title)
        .set(goalTask.toMap());
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('deleted Tasks')
        .doc(goalTask.title)
        .delete();
  }

  Future<void> toggleIsDoneGoalTask({required GoalTask goalTask}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map> snapshot = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc('days')
        .collection(goalTask.date.substring(6))
        .doc(goalTask.title)
        .get();
    if (snapshot.exists) {
      bool isCompleted = snapshot.data()!['isCompleted'];
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('Goals')
          .doc('days')
          .collection(goalTask.date.substring(6))
          .doc(goalTask.title)
          .update({'isCompleted': !isCompleted});
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('Goals')
          .doc(goalTask.goal)
          .collection('tasks')
          .doc(goalTask.title)
          .update({'isCompleted': !isCompleted});
    }
  }

  Future<bool> getGoalTaskCompletionStatus({required GoalTask goalTask}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map> snapshot = await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc('days')
        .collection(goalTask.date.substring(6))
        .doc(goalTask.title)
        .get();
    return await snapshot.data()!['isCompleted'];
  }
}
