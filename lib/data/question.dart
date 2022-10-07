//Beskriver en fråga

//Id, category, correct answer, [incorrect answer], question, difficulty

import 'package:template/views/settings_view.dart';

class Question {
  late String _id;
  late String _category;
  late String _correctAnswer;
  late List<String>
      _incorrectAnswers; // Denna variabeln kommer förmodligen aldrig användas och kan tas bort /August
  late String _question;
  late String _difficulty;
  late List<String> _allAnswersInRandomOrder;

  Question({
    required String id,
    required String category,
    required String correctAnswer,
    required List<String> incorrectAnswers,
    required String question,
    required String difficulty,
  }) {
    _id = id;
    _category = category;
    _correctAnswer = correctAnswer;
    _incorrectAnswers = incorrectAnswers;
    _question = question;
    _difficulty = difficulty;
    _allAnswersInRandomOrder =
        scrambleAllAnswers(incorrectAnswers, correctAnswer);
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      category: json["category"],
      correctAnswer: json["correctAnswer"],
      incorrectAnswers: json["incorrectAnswers"],
      question: json["question"],
      difficulty: json["difficulty"],
    );
  }
  // getters
  get id => _id;
  get category => _category;
  get question => _question;
  get correctAnswer => _correctAnswer;
  get allAnswersInRandomOrder => _allAnswersInRandomOrder;
  get difficulty => _difficulty;

  List<String> scrambleAllAnswers(
    List<String> incorrectAnswers,
    String correctAnswer,
  ) {
    List<String> allAnswersInRandomOrder = incorrectAnswers;
    allAnswersInRandomOrder.add(correctAnswer);
    allAnswersInRandomOrder.shuffle();

    return allAnswersInRandomOrder;
  }
}
