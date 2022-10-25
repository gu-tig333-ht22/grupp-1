// En spelomgång

// Spelets notifier

//
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:template/components/displayCard.dart';
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
  int indexSummaryView = 0;

  late List<Question> gameQuestions;
  late Question currentQuestion;
  late Question nextQuestion;
  late Player player;
  late int questionCounter;

  late List ballsDataList;

  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;
  List<Question> get getGameQuestions => gameQuestions;

  Future startGame() async {
    player = Player();
    questionCounter = 0;
    gameQuestions = await httpConection.getQuestions(settings: settings);
    currentQuestion = gameQuestions[questionCounter];
    ballsDataList =
        gameQuestions.map((question) => question.index + 1).toList();
    setNextQuestion();
  }

  void calculatePlayerScore({required String answer}) {
    if (answer == currentQuestion.correctAnswer) {
      Themes.soundeffect.correct();
      player.correctAnswer(answer);
    } else {
      if (answer == "No answer") {
        Themes.soundeffect.timeout();
      } else {
        Themes.soundeffect.incorrect();
      }
      player.incorrectAnswer(newAnswer: answer);
    }
  }

  void resetSettings() {
    Settings newSettings = Settings();
    settings.setNumberOfQuestions(newSettings.numberOfQuestions);
    settings.setTimePerQuestion(newSettings.timePerQuestion);
    settings.resetCategories();
    settings.checkSettings();
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

  void setNextQuestion() {
    if (questionCounter + 1 < gameQuestions.length) {
      nextQuestion = gameQuestions[questionCounter + 1];
    }
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

  void toggleBluredSummaryView() {
    blured = !blured;
    notifyListeners();
  }

  void addAnswerToBalls() {
    ballsDataList[questionCounter] = player.boolAnswerList[questionCounter];
  }

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
