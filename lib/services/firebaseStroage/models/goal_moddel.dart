class Goal {
  final String title;
  final String desc;
  final int icon;
  final String startDay;
  final String endDay;
  Goal(
      {required this.title,
      required this.desc,
      required this.icon,
      required this.startDay,
      required this.endDay});

  Map<String, dynamic> toMap() {
    return {
      'Goaltitle': title,
      'GoalDesc': desc,
      'icon': icon,
      'startDay': startDay,
      'endDay': endDay
    };
  }

  static Goal fromJson(Map<String, dynamic> json) => Goal(
      title: json["Goaltitle"],
      desc: json["GoalDesc"],
      icon: json['icon'],
      startDay: json['startDay'],
      endDay: json['endDay']);
}
