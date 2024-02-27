import 'package:flutter/material.dart';

class GoalsProvider extends ChangeNotifier {
  String startDay;
  String endDay;
  GoalsProvider({this.endDay = '', this.startDay = ""});
  void getStartDay(String newstartday) {
    startDay = newstartday;
  }

  void getEndDay(String newendday) {
    endDay = newendday;
  }
}
