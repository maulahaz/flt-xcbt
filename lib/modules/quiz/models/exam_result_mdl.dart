import 'dart:convert';

ExamResultModel examResultModelFromJson(String str) => ExamResultModel.fromJson(json.decode(str));

String examResultModelToJson(ExamResultModel data) => json.encode(data.toJson());

class ExamResultModel {
    String status;
    List<ExamResult> data;

    ExamResultModel({
        required this.status,
        required this.data,
    });

    factory ExamResultModel.fromJson(Map<String, dynamic> json) => ExamResultModel(
        status: json["status"],
        data: List<ExamResult>.from(json["data"].map((x) => ExamResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ExamResult {
    int id;
    int userId;
    String kategori;
    String status;
    int timer;
    int score;
    String? hasil;
    int totalSoal;
    int totalCorrect;
    DateTime createdAt;
    DateTime updatedAt;

    ExamResult({
        required this.id,
        required this.userId,
        required this.kategori,
        required this.status,
        required this.totalSoal,
        required this.totalCorrect,
        required this.timer,
        required this.score,
        required this.hasil,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
        id: json["id"],
        userId: json["user_id"],
        kategori: json["kategori"],
        status: json["status"],
        totalSoal: json["total_soal"],
        totalCorrect: json["total_correct"],
        timer: json["timer"],
        score: json["score"],
        hasil: json["hasil"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "kategori": kategori,
        "status": status,
        "total_soal": totalSoal,
        "total_correct": totalCorrect,
        "timer": timer,
        "score": score,
        "hasil": hasil,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}