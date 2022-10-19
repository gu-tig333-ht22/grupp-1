import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/data/game_session.dart';
import 'package:template/data/question.dart';
import 'package:template/theme/theme.dart';
import 'package:template/data/highscore.dart';

class TestView extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    // Provider.of<Highscore>(context, listen: false).newScore(
    //   name: "Merit",
    //   score: 24,
    //   difficulty: "medium",
    //   numberOfQuestions: 24,
    //   timePerQuestion: 20,
    //   categories: ["Arts & Literatures", "Sports"],
    // );
    Provider.of<Highscore>(context, listen: false).getScores();

    return Container();
  }
}
