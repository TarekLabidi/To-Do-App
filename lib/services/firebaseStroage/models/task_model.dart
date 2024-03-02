class Task {
  final String title;
  final String taskGroup;
  final String category;
  final bool isCompleted;
  final int priority;
  final String date;
  final int icon;
  final String kind;

  Task(
      {required this.title,
      required this.taskGroup,
      required this.category,
      required this.isCompleted,
      required this.priority,
      required this.date,
      required this.icon,
      required this.kind});

  Map<String, dynamic> toMap() {
    return {
      'Tasktitle': title,
      'taskGroup': taskGroup,
      'category': category,
      'isCompleted': isCompleted,
      'priority': priority,
      'date': date,
      'icon': icon,
      'kind': kind
    };
  }

  static Task fromJson(Map<String, dynamic> json) => Task(
      title: json["Tasktitle"],
      taskGroup: json["taskGroup"],
      category: json["category"],
      isCompleted: json["isCompleted"],
      priority: json["priority"],
      date: json['date'],
      icon: json['icon'],
      kind: json["kind"]);
}
