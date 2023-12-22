class QuizModel {
  final String image;
  final String name;
  final String type;
  final String description;
  final int duration;
  final String kategori;

  QuizModel({
    required this.image,
    required this.name,
    required this.type,
    required this.description,
    required this.duration,
    required this.kategori,
  });

  TestType get testType => TestType.fromValue(type);
}

enum TestType {
  multipleChoice('Multiple Choice'),
  trueFalse('True or False');

  const TestType(this.value);
  final String value;

  factory TestType.fromValue(String value) {
    return values.firstWhere(
      (result) => result.value == value,
      orElse: () => TestType.multipleChoice,
    );
  }

  bool get isMultipleChoice => this == TestType.multipleChoice;
  bool get isTrueFalse => this == TestType.trueFalse;
}