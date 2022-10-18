import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/data/game_session.dart';
import 'dart:math' as math;

import 'package:template/theme/theme.dart';
import 'package:template/views/answer_view.dart';

class QuestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Center(
      child: Consumer<GameSession>(
        builder: (context, gameSession, child) => Column(
          children: [
            const SizedBox(height: 60),
            CountDownTimer(),
            const Spacer(),
            Text(
              "Question ${gameSession.questionCounter + 1}/${gameSession.gameQuestions.length}",
              style: Themes.textStyle.headline3,
            ),
            const SizedBox(height: 10),
            QuestionCard(
              question: gameSession.currentQuestion,
              answerable: true,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  final CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    double _duration =
        Provider.of<GameSession>(context, listen: true).getTimePerQuestion();
    if (_duration == 61) {
      return Row(
        children: [Text("No time limit")],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Time left', style: Themes.textStyle.headline3),
          const SizedBox(height: 15),
          CircularCountDownTimer(
            controller: _controller,
            duration: _duration.toInt(),
            initialDuration: 0,
            width: 100,
            height: 100,
            ringColor: Colors.grey[300]!,
            ringGradient: null,
            fillColor: Colors.blue, //Måste finnas med men används inte...
            fillGradient: const SweepGradient(
              colors: [Colors.blue, Colors.lightBlue, Colors.red],
              stops: [
                0.0,
                0.5,
                0.7,
              ],
              startAngle: 3 * math.pi / 2,
              endAngle: 7 * math.pi / 2,
              tileMode: TileMode.repeated,
            ),
            backgroundColor: Themes.colors.blueDark,
            backgroundGradient: null,
            strokeWidth: 20.0,
            textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                inherit: false),
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onComplete: () {
              _controller.restart();
              _controller.pause();

              //  Provider.of<GameSession>(context, listen: false)
              //           .calculatePlayerScore();
              //       Navigator.of(context).pushAndRemoveUntil(
              //           MaterialPageRoute(builder: (context) => AnswerView()),
              //           ((route) => false));
            },
          )
        ],
      );
    }
  }
}
