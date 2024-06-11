class Task {
  int id;
  String title;
  bool completed;
  String description;

  Task(
      {required this.id,
      required this.title,
      required this.completed,
      this.description = ''});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'description': description,
    };
  }
}
