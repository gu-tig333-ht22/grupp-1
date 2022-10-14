// En spelomgång

// Spelets notifier

//
import 'package:flutter/material.dart';
import 'package:template/data/http_request.dart';
import 'package:template/data/question.dart';
import 'package:template/data/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/theme/theme.dart';
import 'package:provider/provider.dart';

import '../views/answer_view.dart';
import '../views/summary_view.dart';

class GameSession extends ChangeNotifier {
  late Settings settings;
  HttpConection httpConection = HttpConection();
  bool blured = false;
  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;
  late List<Question> gameQuestions;
  int questionCounter = 0;
  late Question currentQuestion = gameQuestions[questionCounter];

  bool loading = false;

  /// Startar ett nytt spel med nya settings.
  void createNewGame() {
    settings = Settings();
  }

  Future startGame() async {
    loading = true;
    notifyListeners();
    gameQuestions = await httpConection.getQuestions(settings: settings);
    questionCounter = 0;
    loading = false;
    notifyListeners();
    // Anropar question_view,  nja vi kommer gå till sidan direkt ändå
  }

  /// Returnerar alla frågor
  List<Question> getQuestions() => gameQuestions;

  // Question_view
  // Bygger card med List<Questions>[index = counter]
  // Card on tap anropar answer_view

  // Answer_view
  // Bygger card med List<Questions>[index = counter]
  // Filter över hela skärmen. On tap anropar funktion:
  // if counter == List<Questions>.lenght => anropar summar_view
  // else anropar question_view

  void nextQuestion(context) {}

  void updateCategory(categoryName) {
    if (settings.categories.contains(categoryName)) {
      settings.categories.remove(categoryName);
    } else {
      settings.categories.add(categoryName);
    }
    notifyListeners();
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
