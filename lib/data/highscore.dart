import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deta/deta.dart';
import 'package:template/data/game_session.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_client_deta_api/http_client_deta_api.dart';
import 'package:http/http.dart' as http;

class Highscore extends ChangeNotifier {
  String project_key = "a0msltlh_csKQTzS5AtuzqzqkrMNhTyZ79LiCZC8E";
  late var deta;
  late var detabase;

  late List scoresEasy;
  late List scoresMedium;
  late List scoresHard;

  Highscore() {
    deta = Deta(
        projectKey: project_key,
        client: HttpClientDetaApi(http: http.Client()));
    detabase = deta.base("highscores-1");
  }

  void newScore({
    required String name,
    required int score,
    required String difficulty,
    required int numberOfQuestions,
    required int timePerQuestion,
    required List<String> categories,
  }) async {
    await detabase.put({
      "name": name,
      "score": score,
      "difficulty": difficulty,
      "numberOfQuestions": numberOfQuestions,
      "timePerQuestion": timePerQuestion,
      "categories": categories,
    });
  }

  void getScores() async {
    final easy =
        await detabase.fetch(query: [DetaQuery("difficulty").equalTo("easy")]);
    final medium = await detabase
        .fetch(query: [DetaQuery("difficulty").equalTo("medium")]);
    final hard =
        await detabase.fetch(query: [DetaQuery("difficulty").equalTo("hard")]);
    scoresEasy = sortToTen(easy["items"]);
    scoresMedium = sortToTen(medium["items"]);
    scoresHard = sortToTen(hard["items"]);
  }

  List<dynamic> sortToTen(List<dynamic> scores) {
    List<dynamic> sortedList = [];
    for (var score in scores) {}
    return sortedList;
  }
}
