class HabbitTask {
  final String title;
  final String habit;
  final String priority;
  final List days;
  final int icon;
  final String time;
  final bool isCompleted;
  HabbitTask(
      {required this.title,
      required this.habit,
      required this.priority,
      required this.days,
      required this.icon,
      required this.time,
      required this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      "HabbitTasktitle": title,
      "Habbit": habit,
      'Priority': priority,
      'icon': icon,
      'days': days,
      "time": time,
      'isCompleted': isCompleted
    };
  }

  static HabbitTask fromJson(Map<String, dynamic> json) => HabbitTask(
      title: json["HabbitTasktitle"],
      habit: json["Habbit"],
      priority: json['Priority'],
      icon: json['icon'],
      days: json['days'],
      time: json['time'],
      isCompleted: json['isCompleted']);
}
