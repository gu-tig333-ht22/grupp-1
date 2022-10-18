import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LoadingView extends StatelessWidget {
  final CountdownController _controller =
      new CountdownController(autoStart: false);
  @override
  Widget build(BuildContext context) {
    void fetching() async {
      await Provider.of<GameSession>(context, listen: false).startGame();
      _controller.start();
    }

    fetching();

    return ScaffoldWithBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Ready!",
              style: Themes.textStyle.headline1,
            ),
            Countdown(
              controller: _controller,
              seconds: 3,
              build: (_, double time) => Text(
                time.toString(),
                style: Themes.textStyle.headline1,
              ),
              onFinished: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => QuestionView(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
          ],
        ),
      ),
    );
  }
}
