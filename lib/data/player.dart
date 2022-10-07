// Beskriver en spelare
// Name, points, answers

class Player {
  late String name;
  int _score = 0;
  int _streakCounter = 0;
  int _correctAnswers = 0;
  Map _playerAnswers = {};

  Player({this.name = ""});

  get score => _score;
  get correctAnswers => _correctAnswers;

  void increseScore() {
    _score += 1;
  }

  void correctAnswer(questionId, newAnswer) {
    // if (_streakCounter > 3) {
    //   _score += 2;
    // } else {
    //   _score += 1;
    // }
    _correctAnswers += 1;
    _streakCounter += 1;
    _playerAnswers[questionId] = newAnswer;
  }

  void incorrectAnswer(qustionId, newAnswer) {
    //_streakCounter = 0;
    _playerAnswers[qustionId] = newAnswer;
  }
}
