import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:template/data/game_session.dart';

import '../models/score.dart';

//part 'score.g.dart';

class Highscore extends ChangeNotifier {
  App app = App(AppConfiguration("quizter-test-uubhg"));
  late var realm;
  late var scoresSubscription;

  Highscore() {
    realm = loggin();
    subscription();
  }

  Future loggin() async {
    //User loggedInUser = await app.logIn(Credentials.anonymous());

    //var realm = Realm(Configuration.flexibleSync(loggedInUser, [Score.schema]));
    var config = Configuration.local([Score.schema]);
    var realm = Realm(config);
    return realm;
  }

  void subscription() {
    // Check if the subscription already exists before adding
    final scoreSubscription = realm.subscriptions.findByName('Highscores');
    if (scoreSubscription == null) {
      realm.subscriptions.update((mutableSubscriptions) {
        // server-side rules ensure user only downloads their own Todos
        mutableSubscriptions.add(realm.all<Score>(), name: 'Highscores');
      });
    }
  }

  void newScore(
      {required String newName,
      required int newScore,
      required String difficulty}) {
    final score = Score(
      newName,
      newScore,
      difficulty,
    );
    realm.write(() => realm.add(score));
  }

  void addToMongo() {}
}
