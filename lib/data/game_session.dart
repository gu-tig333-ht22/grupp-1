// En spelomgång

// Spelets notifier

//
import 'package:flutter/material.dart';
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
  late Settings settings = Settings();
  HttpConection httpConection = HttpConection();
  bool blured = false;
  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;
  late List<Question> gameQuestions;

  late Question currentQuestion = gameQuestions[questionCounter];
  late Player player;
  late int questionCounter;

  bool loading = false;

  Future startGame() async {
    loading = true;
    player = Player();
    notifyListeners();
    questionCounter = 0;
    gameQuestions = await httpConection.getQuestions(settings: settings);

    loading = false;
    notifyListeners();
  }

  /// Returnerar alla frågor
  //List<Question> getQuestions() => gameQuestions;

  void updateCategory(categoryName) {
    settings.updateSelectedCategories(categoryName);
    notifyListeners();
  }

  void increaseQuestionCounter() {
    questionCounter++;
    currentQuestion = gameQuestions[questionCounter];
    notifyListeners();
  }

  void updateNumberOfQuestion(double numberOfQuestions) {
    settings.setNumberOfQuestions(numberOfQuestions.round());
    notifyListeners(); // skall det vara det
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

  void updateDifficulty(String newDifficulty) {
    settings.setDifficulty(newDifficulty);
    notifyListeners();
  }

  void setblured() {
    blured = !blured;
    notifyListeners();
  }
}
