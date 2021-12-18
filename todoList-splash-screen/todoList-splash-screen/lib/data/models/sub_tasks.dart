class SubTask {
  String title;
  bool? isCompleted;

  SubTask({
    required this.title,
    this.isCompleted = false,
  });

  Map toJson() => {
        'title': title,
        'isCompleted': isCompleted,
      };

  factory SubTask.fromJson(dynamic json) {
    return SubTask(
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }
}
