import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/task_model.dart';

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

  Future createHabbit({
    required String title,
    required String desc,
    required int icon,
  }) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    //create habbit
    Habbit newHabbit = Habbit(
      title: title,
      desc: desc,
      icon: icon,
    );
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc(title)
        .set(newHabbit.toMap());
  }

  Stream<List<Habbit>> getHabits() {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Habbit.fromJson(doc.data())).toList(),
        );
  }

  //create goal
  Future createGoal({
    required String title,
    required String desc,
    required String startDay,
    required String endDay,
    required int icon,
  }) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    Goal newGoal = Goal(
        title: title,
        desc: desc,
        icon: icon,
        //nikomha fhmtch aalh lzmni nklbhom snn ijiw ghltin
        startDay: endDay,
        endDay: startDay);
    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc(title)
        .set(newGoal.toMap());
  }

  Stream<List<Goal>> getGoals() {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Goal.fromJson(doc.data())).toList());
  }

  Future createHabitTask(
      {required String title,
      required String habit,
      required String priority,
      required int icon,
      required String time,
      required List<String> days}) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    HabbitTask newHabbitTask = HabbitTask(
        title: title,
        habit: habit,
        priority: priority,
        days: days,
        icon: icon,
        time: time,
        isCompleted: false);
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc(habit)
        .collection('tasks')
        .doc(title)
        .set(newHabbitTask.toMap());
    for (int i = 0; i < days.length; i++) {
      final day = days[i];
      print(day);
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('Habits')
          .doc('days')
          .collection(day)
          .doc(title)
          .set(newHabbitTask.toMap());
    }
  }

  Stream<List<HabbitTask>> getHabitTasks({required String habit}) {
    final currentUserId = _firebaseAuth.currentUser!.uid;

    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc(habit)
        .collection('tasks')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => HabbitTask.fromJson(doc.data()))
            .toList());
  }

  Stream<List<HabbitTask>> getHabitTasksTP({required String day}) {
    final currentUserId = _firebaseAuth.currentUser!.uid;

    return _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Habits')
        .doc('days')
        .collection(day)
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => HabbitTask.fromJson(doc.data()))
            .toList());
  }

  Future createGoalTask({
    required String title,
    required String category,
    required int priority,
    required String date,
    required int icon,
    required String goal,
  }) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;

    GoalTask newGoalTask = GoalTask(
      title: title,
      category: category,
      isCompleted: false,
      priority: priority,
      date: date,
      icon: icon,
      goal: goal,
    );
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc(goal)
        .collection('tasks')
        .doc(title)
        .set(newGoalTask.toMap());
    print('dateeee${date.substring(6)}');
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('Goals')
        .doc('days')
        .collection(date.substring(6))
        .doc(title)
        .set(newGoalTask.toMap());
  }

  Stream<List<GoalTask>> getGoalTasks({required String goal}) {
    final currenUserId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(currenUserId)
        .collection('Goals')
        .doc(goal)
        .collection('tasks')
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map((doc) => GoalTask.fromJson(doc.data()))
              .toList(),
        );
  }

  Stream<List<GoalTask>> getGoalTasksTP({required String date}) {
    final currenUserId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(currenUserId)
        .collection('Goals')
        .doc('days')
        .collection(date)
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map((doc) => GoalTask.fromJson(doc.data()))
              .toList(),
        );
  }
}
