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

class SideScrollBalls extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SideScrollBalls> {
  double itemWidth = 60.0;
  int itemCount = 7;
  int selected = 1;
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 1);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            magnification: 2.0,
            onSelectedItemChanged: (x) {
              setState(() {
                selected = x;
              });
            },
            controller: _scrollController,
            itemExtent: itemWidth,
            children: List.generate(
                itemCount,
                (x) => RotatedBox(
                    quarterTurns: 1,
                    child: GradientCircle(
                        color: Themes.colors.green,
                        size: 29,
                        child: Icon(Themes.icons.correct)))),
          )),
    );
  }
}
