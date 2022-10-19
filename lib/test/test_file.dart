import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/card.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/data/game_session.dart';
import 'package:template/data/question.dart';
import 'package:template/theme/theme.dart';

/*class TestView extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    return Consumer<GameSession>(
      builder: (context, gameSession, child) => Row(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
              itemExtent: 10,
              children: gameSession.player.boolAnswerList
                  .map(
                    (answer) => RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Themes.colors.red, shape: BoxShape.circle),
                          child: Text('$answer')),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}*/


