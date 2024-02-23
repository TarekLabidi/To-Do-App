class Task {
  final String title;
  final String desc;
  final String taskGroup;
  final String category;
  final String time;
  final bool isCompleted;
  final int priority;

  Task(
      {required this.title,
      required this.desc,
      required this.taskGroup,
      required this.category,
      required this.time,
      required this.isCompleted,
      required this.priority});

  Map<String, dynamic> toMap() {
    return {
      'Tasktitle': title,
      'desc': desc,
      'taskGroup': taskGroup,
      'category': category,
      'time': time,
      'isCompleted': isCompleted,
      'priority': priority
    };
  }
}
