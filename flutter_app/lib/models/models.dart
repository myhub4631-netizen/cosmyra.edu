import 'package:flutter/foundation.dart';

class ExamModel {
  final String id;
  final String name;
  final String code;
  final String? description;

  ExamModel({
    required this.id,
    required this.name,
    required this.code,
    this.description,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'],
    );
  }
}

class SubjectModel {
  final String id;
  final String examId;
  final String name;
  final String code;
  final String colorHex;

  SubjectModel({
    required this.id,
    required this.examId,
    required this.name,
    required this.code,
    required this.colorHex,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] ?? '',
      examId: json['exam_id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      colorHex: json['color_hex'] ?? '#5D3EED',
    );
  }
}

class QuestionOptionModel {
  final String id;
  final String questionId;
  final int optionIndex;
  final String optionText;
  final bool isCorrect;

  QuestionOptionModel({
    required this.id,
    required this.questionId,
    required this.optionIndex,
    required this.optionText,
    required this.isCorrect,
  });

  factory QuestionOptionModel.fromJson(Map<String, dynamic> json) {
    return QuestionOptionModel(
      id: json['id'] ?? '',
      questionId: json['question_id'] ?? '',
      optionIndex: json['option_index'] ?? 0,
      optionText: json['option_text'] ?? '',
      isCorrect: json['is_correct'] ?? false,
    );
  }
}

class QuestionModel {
  final String id;
  final String examId;
  final String subjectId;
  final String chapterId;
  final String questionText;
  final String qType;
  final String difficulty;
  final String source;
  final double marks;
  final double negativeMarks;
  final int? year;
  final String? explanation;
  final String? solution;
  final List<QuestionOptionModel> options;

  QuestionModel({
    required this.id,
    required this.examId,
    required this.subjectId,
    required this.chapterId,
    required this.questionText,
    required this.qType,
    required this.difficulty,
    required this.source,
    required this.marks,
    required this.negativeMarks,
    this.year,
    this.explanation,
    this.solution,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    var rawOptions = json['options'] as List? ?? [];
    List<QuestionOptionModel> parsedOptions = rawOptions
        .map((opt) => QuestionOptionModel.fromJson(opt as Map<String, dynamic>))
        .toList();

    return QuestionModel(
      id: json['id'] ?? '',
      examId: json['exam_id'] ?? '',
      subjectId: json['subject_id'] ?? '',
      chapterId: json['chapter_id'] ?? '',
      questionText: json['question_text'] ?? '',
      qType: json['q_type'] ?? 'single_correct',
      difficulty: json['difficulty'] ?? 'medium',
      source: json['source'] ?? 'practice',
      marks: (json['marks'] as num?)?.toDouble() ?? 4.0,
      negativeMarks: (json['negative_marks'] as num?)?.toDouble() ?? 1.0,
      year: json['year'] as int?,
      explanation: json['explanation'],
      solution: json['solution'],
      options: parsedOptions,
    );
  }
}

class MockTestData {
  final String id;
  final String title;
  final String date;
  final String type;
  final int questions;
  final int marks;
  final String duration;

  MockTestData({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    required this.questions,
    required this.marks,
    required this.duration,
  });
}
