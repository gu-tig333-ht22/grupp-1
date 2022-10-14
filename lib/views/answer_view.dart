import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/test/test_file.dart';
import 'package:template/theme/theme.dart';
import 'package:template/data/game_session.dart';

class AnswerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: InkWell(
        onTap: () => Provider.of<GameSession>(context, listen: false)
            .nextQuestion(context),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text('Score: 5', style: Themes.textStyle.headline1),
              const Spacer(),
              AnswerBalls(),
              // HÄR HAMNAR SCORE OCH BOLLAR
              //const SizedBox(height: 30),
              const Spacer(),
              Text(
                // X/X SKA ERSÄTTAS MED INDEXPOSITION I FRÅGELISTA SAMT VÄRDE PÅ ANTAL FRÅGOR I SETTINGS
                "Question x/x", style: Themes.textStyle.headline2,
              ),
              const SizedBox(height: 10),
              QuestionCard(question: testQuestion1, isActive: false),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
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
    // FUNDERA PÅ MITTENCIRKEL STÖRRE
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
