// En spelomgång

// Spelets notifier

//
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:template/data/http_request.dart';
import 'package:template/data/player.dart';
import 'package:template/data/question.dart';
import 'package:template/data/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/theme/theme.dart';
import 'package:provider/provider.dart';

import '../views/answer_view.dart';
import '../views/summary_view.dart';

class GameSession extends ChangeNotifier {
  Settings settings = Settings();
  HttpConection httpConection = HttpConection();
  bool blured = false;
  bool loading = false;

  late List<Question> gameQuestions;
  late Question currentQuestion;
  late Player player;
  late int questionCounter;

  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;

  Future startGame() async {
    loading = true;
    player = Player();
    notifyListeners();
    questionCounter = 0;
    gameQuestions = await httpConection.getQuestions(settings: settings);
    currentQuestion = gameQuestions[questionCounter];
    loading = false;
    notifyListeners();
  }

  void calculatePlayerScore({required String answer}) {
    if (answer == currentQuestion.correctAnswer) {
      player.correctAnswer(answer);
    } else {
      player.incorrectAnswer(newAnswer: answer);
    }
  }

  void resetSettings() {
    settings = Settings();
    notifyListeners();
  }

  void updateCategory(categoryName) {
    settings.updateSelectedCategories(categoryName);
    notifyListeners();
  }

  void increaseQuestionCounter() {
    questionCounter++;
    if (questionCounter < gameQuestions.length) {
      currentQuestion = gameQuestions[questionCounter];
    }
  }

  void updateNumberOfQuestion(double numberOfQuestions) {
    settings.setNumberOfQuestions(numberOfQuestions.round());
    notifyListeners(); // skall det vara det
  }

  Widget getNumberOfQuestionSlider() {
    return Text(getNumberOfQuestion().toString(),
        style: TextStyle(color: Themes.colors.white));
  }

  double getNumberOfQuestion() {
    return settings.numberOfQuestions.toDouble();
  }

  void updateTimePerQuestion(double newTime) {
    settings.setTimePerQuestion(newTime.round());
    notifyListeners(); // skall det vara det
  }

  double getTimePerQuestion() {
    return settings.timePerQuestion.toDouble();
  }

  Widget getTimePerQuestionSlider() {
    double number = getTimePerQuestion();
    if (number == 61) {
      return Icon(
        OctIcons.infinity_16,
        size: 15,
        color: Themes.colors.white,
      );
    } else {
      return Text(number.toString(),
          style: TextStyle(color: Themes.colors.white));
    }
  }

  void updateDifficulty(String newDifficulty) {
    settings.setDifficulty(newDifficulty);
    notifyListeners();
  }

  void setblured() {
    blured = !blured;
    notifyListeners();
  }
}
