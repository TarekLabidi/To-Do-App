import 'package:flutter/material.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';

class HabitsProvider extends ChangeNotifier {
  String time;
  bool isValid = false;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  HabitsProvider({this.time = '??:??'});

  void getTime(String newtime) {
    time = newtime;
    notifyListeners();
  }

  void onchanged(bool isEmpty) {
    isValid = isEmpty;
    notifyListeners();
  }

  void cancelTime() {
    time = '??:??';
    notifyListeners();
  }

  void removeDay(String day, bool isSelected) {
    if (!isSelected) {
      days.remove(day);
    } else {
      days.add(day);
    }
  }

  void resetDays() {
    days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  List<Map<String, dynamic>> targetDays(List days) {
    List<String> week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<Map<String, dynamic>> presentDays = [];

    for (int i = 0; i < week.length; i++) {
      String day = week[i];
      if (days.contains(day)) {
        presentDays.add({'day': day, 'present': true});
      } else {
        presentDays.add({'day': day, 'present': false});
      }
    }
    return presentDays;
  }

  double percentageOfHabits(List<HabbitTask> habits) {
    int completed = 0;
    for (int i = 0; i < habits.length; i++) {
      if (habits[i].isCompleted == true) {
        completed++;
      }
    }
    return completed / habits.length;
  }
}
