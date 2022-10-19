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
  int indexSummaryView = 0;

  late List<Question> gameQuestions;
  late Question currentQuestion;
  late Player player;
  late int questionCounter;

  late List ballsDataList;

  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;
  List<Question> get getGameQuestions => gameQuestions;

  Future startGame() async {
    loading = true;
    player = Player();
    notifyListeners();
    questionCounter = 0;
    gameQuestions = await httpConection.getQuestions(settings: settings);
    currentQuestion = gameQuestions[questionCounter];
    ballsDataList =
        gameQuestions.map((question) => question.index + 1).toList();
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

  void toggleBluredSummaryView() {
    blured = !blured;
    notifyListeners();
  }

  // Funktioner och data för boll-scrollen

  void addAnswerToBalls() {
    ballsDataList[questionCounter] = player.boolAnswerList[questionCounter];
  void setIndexSummaryView({required int index}) {
    indexSummaryView = index;
  }

  int getIndexSummaryView() {
    return indexSummaryView;
  }

  String getPlayerAnswerSummaryView({required int index}) {
    String playerAnswer = player.playerAnswers[index];
    String correctAnswer = getGameQuestions[index].correctAnswer;

    if (playerAnswer == "No answer") {
      return "No answer";
    } else if (playerAnswer == correctAnswer) {
      return "Correct answer";
    } else {
      return "Wrong answer";
    }
  }
}
