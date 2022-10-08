// Beskriver en spelare
// Name, points, answers

/// # Player
/// Player is the class that holds information about the player.
///
///
/// Name, score, streakCounter, longestStreak, correctAnswers and playerAnswers.
/// * Player.score => current score as int.
/// * Player.correctAnswers => number of correct answers as int.
/// * Player.playerAnswers => Map of questionID and answer.
/// * Player.correctAnswer(questionId, newAnswer) updates the score and streak.
///   Also updates playerAnswer```{questionId:playerAnswer}```
/// * Player.incorrectAnswer(questionId, newAnswer). Also updates playerAnswer
///   ```{questionId:playerAnswer}```
class Player {
  late String name;
  int _score = 0;
  int _streakCounter = 0; // if we deside to implement streakCounter
  int _longestStreak = 0; // or change score per question we also
  int _correctAnswers = 0; // need to track number of correct answers
  Map _playerAnswers = {};

  Player({this.name = ""});

  /// Returns score as int.
  get score => _score;

  /// Returns number of correctAnswer as int.
  get correctAnswers => _correctAnswers;

  /// Returns map of all the answerd questions with questionId ass key.
  /// ```{questionId:playerAnswer}```
  get playerAnswers => _playerAnswers;

  /// Call if player answers correctly we increse score by 1, streakCounter by 1
  /// and correctAnswers by 1. The longest streak is also updatet. Also add the
  /// answer(string) with questionId as key to playerAnswers map
  /// ```{questionId:newAnswer}```.
  void correctAnswer(questionId, newAnswer) {
    _streakCounter += 1;
    if (_streakCounter > _longestStreak) {
      _longestStreak = _streakCounter;
    }
    if (_streakCounter > 3) {
      _score += 1; //  could be incresed of streak is implemented
    } else {
      _score += 1;
    }
    _correctAnswers += 1;
    _playerAnswers[questionId] = newAnswer;
  }

  /// Call if player answers incorectly, we update the longest streak if
  /// streakCounter is longer and the set streakCounter to 0. Also add the
  /// answer(string) with questionId as key to playerAnswers map
  /// ```{questionId:newAnswer}```.
  void incorrectAnswer(qustionId, newAnswer) {
    if (_streakCounter > _longestStreak) {
      _longestStreak = _streakCounter;
    }
    _streakCounter = 0;
    _playerAnswers[qustionId] = newAnswer;
  }
}
