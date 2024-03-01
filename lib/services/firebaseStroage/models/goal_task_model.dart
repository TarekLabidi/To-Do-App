class GoalTask {
  final String title;

  final String category;
  final bool isCompleted;
  final int priority;
  final String date;
  final int icon;
  final String goal;

  GoalTask({
    required this.title,
    required this.category,
    required this.isCompleted,
    required this.priority,
    required this.date,
    required this.icon,
    required this.goal,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'isCompleted': isCompleted,
      'priority': priority,
      'date': date,
      'icon': icon,
      'goal': goal,
    };
  }

  static GoalTask fromJson(Map<String, dynamic> json) {
    return GoalTask(
      title: json['title'],
      category: json['category'],
      isCompleted: json['isCompleted'],
      priority: json['priority'],
      date: json['date'],
      icon: json['icon'],
      goal: json['goal'],
    );
  }
}
