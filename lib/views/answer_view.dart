import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/test/test_file.dart';
import 'package:template/theme/theme.dart';
import 'package:template/data/game_session.dart';
import 'package:template/views/question_view.dart';
import 'package:template/views/summary_view.dart';

class AnswerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Consumer<GameSession>(
      builder: (context, gameSession, child) => InkWell(
        onTap: () {
          gameSession.increaseQuestionCounter();
          if (gameSession.questionCounter >= gameSession.gameQuestions.length) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SummaryView()),
                ((route) => false));
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => QuestionView()),
                ((route) => false));
          }
        },
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text('Score: ${gameSession.player.score}',
                  style: Themes.textStyle.headline1),
              const Spacer(),
              AnswerBalls(),
              const Spacer(),
              Text(
                // X/X SKA ERSÄTTAS MED INDEXPOSITION I FRÅGELISTA SAMT VÄRDE PÅ ANTAL FRÅGOR I SETTINGS
                "Question ${gameSession.questionCounter + 1}/${gameSession.gameQuestions.length}",
                style: Themes.textStyle.headline2,
              ),
              const SizedBox(height: 10),
              QuestionCard(
                  question: gameSession.currentQuestion, isActive: false),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class AnswerBalls extends StatelessWidget {
  // LOGIK FÖR ATT SKAPA LISTAN SOM VISAS PÅ SKÄRMEN ÄR EJ IMPLEMENTERAD
  List<dynamic> ballData = [
    false,
    true,
    false,
    false,
    '6',
    '7',
    '8',
  ];

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    List<Widget> balls = ballData.map((ball) {
      if (ball == false) {
        return GradientCircle(
            color: Themes.colors.red,
            size: 28,
            child:
                Icon(Themes.icons.wrong, color: Themes.colors.white, size: 20));
      }
      if (ball == true) {
        return GradientCircle(
            color: Themes.colors.green,
            size: 28,
            child: Icon(Themes.icons.correct,
                color: Themes.colors.white, size: 20));
      } else {
        return GradientCircle(
            color: Themes.colors.grey,
            size: 28,
            child: Text(ball, style: Themes.textStyle.headline3));
      }
    }).toList();
    // FUNDERA PÅ MITTENCIRKEL STÖRRE -- GÖR TILL EN CYLINDERSCROLL?!
    return Container(
      width: deviceWidth * 0.8,
      child: Wrap(
          alignment: WrapAlignment.start,
          // Minus behövs för att bredden blir aaaningen för stor vid beräkningen annars
          spacing: ((deviceWidth * 0.8 - 7 * 28) / 6) - 0.00000000000001,
          children: balls),
    );
  }
}
