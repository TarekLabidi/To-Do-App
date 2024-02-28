import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/utils/palette.dart';

class ToDoProvider extends ChangeNotifier {
  String day;
  String time;
  String date;
  bool isPresent;
  ToDoProvider(
      {this.day = '', this.time = '', this.date = '', this.isPresent = false});

  IconData getGroupTaskIcon(int tasksDone) {
    if (-1 < tasksDone && tasksDone < 11) {
      return FontAwesomeIcons.userNinja;
    }
    if (10 < tasksDone && tasksDone < 51) {
      return FontAwesomeIcons.userAstronaut;
    }
    if (50 < tasksDone && tasksDone < 101) {
      // ignore: deprecated_member_use
      return FontAwesomeIcons.rocket;
    }
    if (100 < tasksDone && tasksDone < 301) {
      return FontAwesomeIcons.gem;
    }
    return FontAwesomeIcons.crown;
  }

  Color getGroupTaskColor(int tasksDone) {
    if (-1 < tasksDone && tasksDone < 11) {
      return const Color.fromARGB(255, 210, 255, 211);
    }
    if (10 < tasksDone && tasksDone < 51) {
      return const Color.fromARGB(255, 255, 242, 204);
    }
    if (50 < tasksDone && tasksDone < 101) {
      // ignore: deprecated_member_use
      return const Color.fromARGB(255, 255, 189, 184);
    }
    if (100 < tasksDone && tasksDone < 301) {
      return Palette.purpleColorscondary;
    }
    return SecondaryColors.pink;
  }

  double geTaskGroupPercentage(int tasksDone) {
    if (tasksDone == 0) {
      return 0;
    }
    if (0 < tasksDone && tasksDone < 11) {
      return tasksDone / 11;
    }
    if (10 < tasksDone && tasksDone < 51) {
      // ignore: deprecated_member_use
      return tasksDone / 51;
    }
    if (50 < tasksDone && tasksDone < 101) {
      return tasksDone / 101;
    }
    if (100 < tasksDone && tasksDone < 301) {
      return tasksDone / 301;
    }
    return 1;
  }

  Color getGroupTaskIconColor(int tasksDone) {
    if (-1 < tasksDone && tasksDone < 11) {
      return Color.fromARGB(255, 117, 240, 119);
    }
    if (10 < tasksDone && tasksDone < 51) {
      return Color.fromARGB(255, 163, 124, 8);
    }
    if (50 < tasksDone && tasksDone < 101) {
      // ignore: deprecated_member_use
      return Color.fromARGB(255, 200, 59, 49);
    }
    if (100 < tasksDone && tasksDone < 301) {
      return Palette.purpleColor;
    }
    return PrimaryColors.pink;
  }

  void getDay(String setedDate) {
    day = setedDate;
    notifyListeners();
  }

  void getTime(String setedTime) {
    time = setedTime;
    notifyListeners();
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

  String getCategory(int value) {
    if (value == 0) {
      return 'Work';
    } else if (value == 1) {
      return 'Flutter';
    } else if (value == 2) {
      return 'Study';
    } else if (value == 3) {
      return 'Sports';
    } else {
      return 'Others';
    }
  }

  void disposeVars() {
    date = '';
    day = '';
    time = '';
  }

  IconData getIcon(int value) {
    if (value == 0) {
      return FontAwesomeIcons.suitcase;
    } else if (value == 1) {
      return Icons.flutter_dash;
    } else if (value == 2) {
      return FontAwesomeIcons.book;
    } else if (value == 3) {
      return FontAwesomeIcons.dumbbell;
    } else {
      return Icons.help_outline;
    }
  }

  IconData getIconWithName(String value) {
    if (value == 'Work') {
      return FontAwesomeIcons.suitcase;
    } else if (value == 'Flutter') {
      return Icons.flutter_dash;
    } else if (value == 'Study') {
      return FontAwesomeIcons.book;
    } else if (value == 'Sports') {
      return FontAwesomeIcons.dumbbell;
    } else {
      return Icons.help_outline;
    }
  }

  Color getColorPrimaryWithName(String value) {
    if (value == 'Work') {
      return PrimaryColors.pink;
    } else if (value == 'Flutter') {
      return const Color.fromARGB(255, 104, 187, 255);
    } else if (value == 'Study') {
      return PrimaryColors.pruple;
    } else if (value == 'Sports') {
      return Colors.green;
    } else {
      return PrimaryColors.orange;
    }
  }

  Color getColorSecondaryWithName(String value) {
    if (value == 'Work') {
      return SecondaryColors.pink;
    } else if (value == 'Flutter') {
      return const Color.fromARGB(255, 197, 229, 255);
    } else if (value == 'Study') {
      return SecondaryColors.pruple;
    } else if (value == 'Sports') {
      return const Color.fromARGB(255, 207, 255, 209);
    } else {
      return SecondaryColors.orange;
    }
  }

  Color getPriority(int value) {
    if (value == 1) {
      return Colors.red;
    } else if (value == 2) {
      return const Color.fromARGB(255, 248, 126, 4);
    } else if (value == 3) {
      return Color.fromARGB(255, 168, 190, 0);
    } else {
      return Colors.green;
    }
  }

  Color getPrioritySecondary(int value) {
    if (value == 1) {
      return const Color.fromARGB(255, 255, 190, 185);
    } else if (value == 2) {
      return const Color.fromARGB(255, 255, 203, 151);
    } else if (value == 3) {
      return const Color.fromARGB(255, 248, 255, 198);
    } else {
      return const Color.fromARGB(255, 185, 255, 188);
    }
  }
}
