import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/utils/palette.dart';

class GoalsProvider extends ChangeNotifier {
  String startDay;
  String endDay;
  String day;
  String time;
  String date;
  GoalsProvider({
    this.endDay = '',
    this.startDay = "",
    this.day = '',
    this.time = '',
    this.date = '',
  });
  void getStartDay(String newstartday) {
    startDay = newstartday;
  }

  void getEndDay(String newendday) {
    endDay = newendday;
  }

  void resetDates() {
    startDay = '';
    endDay = '';
  }

  void getDay(String setedDate) {
    day = setedDate;
    notifyListeners();
  }

  void getTime(String setedTime) {
    time = setedTime;
    notifyListeners();
  }

  void disposeVars() {
    date = '';
    day = '';
    time = '';
  }

  String getDate() {
    date = '$time $day';
    if (date == '' || time == "") {
      date = DateFormat('dd MM yyyy').format(DateTime.now());

      return '??:?? $date';
    } else {
      return date;
    }
  }

  Color getGoalCardColor(int value) {
    if (value == 1) {
      return const Color.fromRGBO(213, 234, 255, 1);
    } else if (value == 2) {
      return const Color.fromARGB(255, 209, 197, 255);
    } else if (value == 3) {
      return SecondaryColors.orange;
    } else if (value == 4) {
      return const Color.fromARGB(255, 200, 255, 248);
    } else {
      return SecondaryColors.pink;
    }
  }

  Color getGoalCardPercentageColor(int value) {
    if (value == 1) {
      return const Color.fromRGBO(85, 170, 255, 1);
    } else if (value == 2) {
      return const Color.fromARGB(255, 148, 121, 255);
    } else if (value == 3) {
      return PrimaryColors.orange;
    } else if (value == 4) {
      return const Color.fromARGB(255, 82, 255, 232);
    } else {
      return PrimaryColors.pink;
    }
  }

  double calDays(String date1String, String date2String) {
    if (date1String == '' || date2String == '') {
      return 0;
    }

    String nowDate = DateFormat('dd MM yyyy').format(DateTime.now());

    // Convert strings to DateTime objects
    List<String> date1Parts = date1String.split(' ');
    List<String> date2Parts = date2String.split(' ');
    List<String> nowDateParts = nowDate.split(' ');

    DateTime date1 = DateTime(int.parse(date1Parts[2]),
        int.parse(date1Parts[1]), int.parse(date1Parts[0]));
    DateTime date2 = DateTime(int.parse(date2Parts[2]),
        int.parse(date2Parts[1]), int.parse(date2Parts[0]));
    DateTime nowdate = DateTime(int.parse(nowDateParts[2]),
        int.parse(nowDateParts[1]), int.parse(nowDateParts[0]));

    // Check if date2 is before nowdate
    if (date2.isBefore(nowdate)) {
      return 1;
    }
    if (nowdate.isBefore(date1)) {
      return 0;
    }

    // Calculate the difference in days
    int differenceInDays = date2.difference(date1).inDays;
    int diff = nowdate.difference(date1).inDays;

    return diff / differenceInDays;
  }

  bool isInProgress(String date1String, String date2String) {
    String nowDate = DateFormat('dd MM yyyy').format(DateTime.now());

    // Convert strings to DateTime objects
    List<String> date1Parts = date1String.split(' ');
    List<String> date2Parts = date2String.split(' ');
    List<String> nowDateParts = nowDate.split(' ');

    DateTime date1 = DateTime(int.parse(date1Parts[2]),
        int.parse(date1Parts[1]), int.parse(date1Parts[0]));
    DateTime date2 = DateTime(int.parse(date2Parts[2]),
        int.parse(date2Parts[1]), int.parse(date2Parts[0]));
    DateTime nowdate = DateTime(int.parse(nowDateParts[2]),
        int.parse(nowDateParts[1]), int.parse(nowDateParts[0]));

    // Check if date2 is before nowdate
    if (date2.isBefore(nowdate)) {
      return false;
    }
    if (nowdate.isBefore(date1)) {
      return false;
    }
    return true;
  }
}
