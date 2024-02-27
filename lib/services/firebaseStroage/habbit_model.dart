class Habbit {
  final String title;
  final String desc;
  final int icon;
  Habbit({required this.title, required this.desc, required this.icon});

  Map<String, dynamic> toMap() {
    return {
      'Habittitle': title,
      'HabitDesc': desc,
      'icon': icon,
    };
  }

  static Habbit fromJson(Map<String, dynamic> json) => Habbit(
        title: json["Habittitle"],
        desc: json["HabitDesc"],
        icon: json['icon'],
      );
}
