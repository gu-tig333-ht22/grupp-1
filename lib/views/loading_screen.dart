import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LoadingView extends StatelessWidget {
  final CountdownController _controller = CountdownController(autoStart: false);

  LoadingView({super.key});
  @override
  Widget build(BuildContext context) {
    bool getReady = true;
    void fetching() async {
      await Provider.of<GameSession>(context, listen: false).startGame();
      getReady = false;
      _controller.start();
    }

    fetching();

    return ScaffoldWithBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 20),
            Themes.textStyle.headlineGradient(text: 'Quizter', fontSize: 44),
            Themes.textStyle.headlineGradient(text: 'Pettersson', fontSize: 44),
            const SizedBox(height: 200),
            Countdown(
              controller: _controller,
              seconds: 4, // Behöver vara 4a då Get ready inte hinner försvinna.
              build: (_, double time) => getReady
                  ? Text(
                      "Get Ready!",
                      style: Themes.textStyle.headline1,
                    )
                  : time <= 0
                      ? Text(
                          "Go!",
                          style: Themes.textStyle.headline1,
                        )
                      : Text(
                          time.round().toString(),
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
