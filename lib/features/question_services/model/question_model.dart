class AnswerModel {
  final int id;
  final int questionId;
  final String answer;
  final DateTime createdAt;
  final DateTime updatedAt;

  AnswerModel({
    required this.id,
    required this.questionId,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      questionId: json['question_id'],
      answer: json['answer'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'answer': answer,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class QuestionModel {
  final int id;
  final String name;
  final String type;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.name,
    required this.type,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      answers: (json['answers'] as List)
          .map((answerJson) => AnswerModel.fromJson(answerJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}
