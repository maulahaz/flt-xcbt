import 'dart:convert';

class ExamModel {
  final String message;
  //timer
  final int timer;
  final List<Question> data;

  ExamModel({
    required this.message,
    required this.data,
    required this.timer,
  });

  factory ExamModel.fromJson(String str) =>
      ExamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamModel.fromMap(Map<String, dynamic> json) =>
      ExamModel(
        message: json["message"],
        timer: json["timer"] ?? 0,
        data: List<Question>.from(json["data"].map((x) => Question.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Question {
  final int id;
  final String pertanyaan;
  final String kategori;
  final String opsiA;
  final String opsiB;
  final String opsiC;
  final String dopsiD;

  Question({
    required this.id,
    required this.pertanyaan,
    required this.kategori,
    required this.opsiA,
    required this.opsiB,
    required this.opsiC,
    required this.dopsiD,
  });

  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        id: json["id"],
        pertanyaan: json["pertanyaan"],
        kategori: json["kategori"],
        opsiA: json["opsi_a"],
        opsiB: json["opsi_b"],
        opsiC: json["opsi_c"],
        dopsiD: json["opsi_d"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "kategori": kategori,
        "opsi_a": opsiA,
        "opsi_b": opsiB,
        "opsi_c": opsiC,
        "opsi_d": dopsiD,
      };
}