// Beskriver en spelare
// Name, points, answers

class Player {
  late String name;
  int _score = 0;
  int streakCounter = 0;
  int _correctAnswers = 0;
  Map playerAnswers = {};

  Player({this.name = ""});

  get score => _score;
  get correctAnswers => _correctAnswers;

  void addCorrectAnswer(questionId, newAnswer) {
    _correctAnswers += 1;
  }
}
