import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/test/test_file.dart';
import 'package:template/theme/theme.dart';
import 'package:template/data/game_session.dart';
import 'package:template/views/question_view.dart';
import 'package:template/views/summary_view.dart';
import 'package:template/components/endgamebutton.dart';

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
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => SummaryView(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
                ((route) => false));
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => QuestionView(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
                ((route) => false));
          }
        },
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 35, top: 20),
                    child: EndGameButton(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text('Score: ${gameSession.player.score}',
                  style: Themes.textStyle.headline1),
              const Spacer(),
              SideScrollBalls(),
              const Spacer(),
              Text(
                "Question ${gameSession.questionCounter + 1}/${gameSession.gameQuestions.length}",
                style: Themes.textStyle.headline2,
              ),
              const SizedBox(height: 10),
              QuestionCard(
                  question: gameSession.currentQuestion, answerable: false),
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

class SideScrollBalls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameSession>(
      builder: (context, gameSession, child) => Expanded(
        child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            controller: FixedExtentScrollController(
                initialItem: gameSession.questionCounter),
            itemExtent: 50,
            children: gameSession.ballsDataList.map((question) {
              double size = gameSession.questionCounter == question ? 35 : 25;

              if (question == true) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: GradientCircle(
                    color: Themes.colors.green,
                    size: size,
                    child: Icon(Themes.icons.correct),
                  ),
                );
              }
              if (question == false) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: GradientCircle(
                    color: Themes.colors.red,
                    size: size,
                    child: Icon(Themes.icons.wrong),
                  ),
                );
              } else {
                return RotatedBox(
                  quarterTurns: 1,
                  child: GradientCircle(
                    color: Themes.colors.greyLight,
                    size: 25,
                    child: Text('$question'),
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}

/*class AnswerCircles extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    List<Widget> circles = circleData.map((circle) {
      if (circle == false) {
        return GradientCircle(
            color: Themes.colors.red,
            size: 28,
            child:
                Icon(Themes.icons.wrong, color: Themes.colors.white, size: 20));
      }
      if (circle == true) {
        return GradientCircle(
            color: Themes.colors.green,
            size: 28,
            child: Icon(Themes.icons.correct,
                color: Themes.colors.white, size: 20));
      } else {
        return GradientCircle(
            color: Themes.colors.grey,
            size: 28,
            child: Text(circle, style: Themes.textStyle.headline3));
      }
    }).toList();
    // FUNDERA PÅ MITTENCIRKEL STÖRRE -- GÖR TILL EN CYLINDERSCROLL?!
    return Container(
      width: deviceWidth * 0.8,
      child: Wrap(
          alignment: WrapAlignment.start,
          // Minus behövs för att bredden blir aaaningen för stor vid beräkningen annars
          spacing: ((deviceWidth * 0.8 - 7 * 28) / 6) - 0.00000000000001,
          children: circles),
    );
  }
}*/
