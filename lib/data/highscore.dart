import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deta/deta.dart';
import 'package:template/data/game_session.dart';
import 'package:http_client_deta_api/http_client_deta_api.dart';
import 'package:http/http.dart' as http;

/// Koppling till Databas för Highscore. Tre listor med Highscores.
/// highscoreEasy, highscoreMedium, highscoreHard.
/// Listorna innehåller Maps(dictionarys) med name, score, difficulty,
/// numberOfQuestions, timePerQuestion, categories(Lista med String).
class Highscore extends ChangeNotifier {
  String project_key = "a0msltlh_csKQTzS5AtuzqzqkrMNhTyZ79LiCZC8E";
  late var deta;
  late var detabase;

  late List _scoresEasy;
  late List _scoresMedium;
  late List _scoresHard;
  String _difficultyToView = "medium";

  // Öppnar kopplingen till databasen.
  Highscore() {
    deta = Deta(
        projectKey: project_key,
        client: HttpClientDetaApi(http: http.Client()));
    detabase = deta.base("highscores-1");
  }

  // Getters för de olika score
  List get highscoreEasy => _scoresEasy;
  List get highscoreMedium => _scoresMedium;
  List get highscoreHart => _scoresHard;
  String get difficultyToView => _difficultyToView;

  List getChosenHighscores() {
    if (difficultyToView == "easy") {
      return _scoresEasy;
    } else if (difficultyToView == "medium") {
      return _scoresMedium;
    } else if (difficultyToView == "hard") {
      return _scoresHard;
    }
    return _scoresMedium;
  }

  void setDifficultyToView(String newDifficultyToView) {
    _difficultyToView = newDifficultyToView;
    notifyListeners();
  }

  /// Använd för att skapa ett nytt objekt i databasen.
  void addNewScore({
    required String name,
    required int score,
    required String difficulty,
    required int longestStreak,
    required int numberOfQuestions,
    required int timePerQuestion,
    required List<String> categories,
  }) async {
    // Själva insättningen i databasen.
    await detabase.put({
      "name": name,
      "score": score,
      "difficulty": difficulty,
      "longestStreak": longestStreak,
      "numberOfQuestions": numberOfQuestions,
      "timePerQuestion": timePerQuestion,
      "categories": categories,
    });
  }

  /// Hämtar alla Highscore och använder sortTopTen för att sätta
  /// _scoresEasy-Medium-Hard till nya sorterade listor.
  void fetchScores() async {
    final easy =
        await detabase.fetch(query: [DetaQuery("difficulty").equalTo("easy")]);
    final medium = await detabase
        .fetch(query: [DetaQuery("difficulty").equalTo("medium")]);
    final hard =
        await detabase.fetch(query: [DetaQuery("difficulty").equalTo("hard")]);
    _scoresEasy = sortTopTen(easy["items"]);
    _scoresMedium = sortTopTen(medium["items"]);
    _scoresHard = sortTopTen(hard["items"]);
  }

  /// Lämnar tillbaka top tio lista sorterad från störst till lägst.
  List<dynamic> sortTopTen(List<dynamic> scores) {
    List<dynamic> sortedList = [];
    int topTen = 0;
    while (scores.isNotEmpty && topTen <= 10) {
      topTen++;
      Map largest = scores.first;
      for (Map score in scores) {
        if (score["score"] > largest["score"]) {
          largest = score;
        }
      }
      sortedList.add(largest);
      scores.remove(largest);
    }
    return sortedList;
  }
}
