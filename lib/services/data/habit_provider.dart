import 'package:flutter/material.dart';

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
}
