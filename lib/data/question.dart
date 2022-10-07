//Beskriver en fråga

//Id, category, correct answer, [incorrect answer], question, difficulty

class Question {
  late String _id;
  late String _category;
  late String _correctAnswer;
  late List<String> _incorrectAnswers;
  late String _question;
  late String _difficulty;

  Question(
      {required String id,
      required String category,
      required String correctAnswer,
      required List<String> incorrectAnswers,
      required String question,
      required String difficulty}) {
    _id = id;
    _category = category;
    _correctAnswer = correctAnswer;
    _incorrectAnswers = incorrectAnswers;
    _question = question;
    _difficulty = difficulty;
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
}
