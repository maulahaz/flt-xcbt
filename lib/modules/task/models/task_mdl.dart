class TaskModel {
  int? id;
  String title;
  bool isDone;

  TaskModel({this.id, required this.title, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? 0,
      title: map['title'],
      isDone: map['isDone'] == 1,
    );
  }
}