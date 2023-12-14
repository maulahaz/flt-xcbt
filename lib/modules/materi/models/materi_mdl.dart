import 'dart:convert';

class MateriModel {
  final String status;
  final List<Materi> data;

  MateriModel({
    required this.status,
    required this.data,
  });

  factory MateriModel.fromJson(String str) =>
      MateriModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MateriModel.fromMap(Map<String, dynamic> json) => MateriModel(
        status: json["status"],
        data: List<Materi>.from(json["data"].map((x) => Materi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Materi {
  final int id;
  final String title;
  final String content;
  final String picture;
  final DateTime createdAt;
  final DateTime updatedAt;

  Materi({
    required this.id,
    required this.title,
    required this.content,
    required this.picture,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Materi.fromJson(String str) => Materi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Materi.fromMap(Map<String, dynamic> json) => Materi(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        picture: json["picture"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "content": content,
        "picture": picture,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
