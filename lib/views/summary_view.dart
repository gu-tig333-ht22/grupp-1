import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/test/test_file.dart';
import 'package:template/components/card.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/views/start_view.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class SummaryView extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Consumer<GameSession>(
      builder: (context, gameSession, child) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              children: [
                Text("Scorescreen", style: Themes.textStyle.headline1),
                Container(height: 15),
                _scoreTable(context),
                Container(height: 30),
                _summaryTable(context),
                Container(
                  height: 30,
                ),
                NavigationButton(
                  text: Text(
                    "New game",
                    style: Themes.textStyle.headline1,
                  ),
                  width: 250,
                  height: 50,
                  color: Themes.colors.blueDark,
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/settings_view'));
                  },
                ),
              ],
            ),
          ),
          _setblured(context),
          _card(context)
        ],
      ),
    ));
  }

  Widget _setblured(context) {
    if (Provider.of<GameSession>(context, listen: false).blured) {
      return GestureDetector(
        onTap: () {
          Provider.of<GameSession>(context, listen: false).setblured();
        },
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _card(context) {
    if (Provider.of<GameSession>(context, listen: false).blured) {
      return Center(
          child: QuestionCard(
        question: testQuestion1,
        answerable: false,
      ));
    } else {
      return Container();
    }
  }

  Widget _scoreTable(context) {
    int playerScore =
        Provider.of<GameSession>(context, listen: false).player.score;
    int totalScore =
        Provider.of<GameSession>(context, listen: false).gameQuestions.length;
    int wrongAnswers = (totalScore - playerScore);
    double spaceBetween = 15;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _scoreCircle(
              number: playerScore,
              text: "Correct \nAnswers",
              color: Themes.colors.green),
          Container(
            width: spaceBetween,
          ),
          _scoreCircle(
              number: wrongAnswers,
              text: "Wrong \nAnswers",
              color: Themes.colors.red),
          Container(
            width: spaceBetween,
          ),
          _scoreCircle(
              number: totalScore, text: "Total", color: Themes.colors.grey)
        ],
      ),
    );
  }

  Widget _scoreCircle(
      {required int number, required String text, required Color color}) {
    return Column(
      children: [
        GradientCircle(
            color: color,
            size: 80,
            child: Text(
              number.toString(),
              style: Themes.textStyle.headline1,
            )),
        Container(
          height: 5,
        ),
        Text(
          text,
          style: Themes.textStyle.headline3,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _summaryTable(context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Summary",
            style: Themes.textStyle.headline2,
          ),
          Container(
            height: 10,
          ),
          _listView(context),
        ],
      ),
    );
  }

  Widget _listView(context) {
    List<bool> boolAnswerList =
        Provider.of<GameSession>(context, listen: false).player.boolAnswerList;
    return Expanded(
      child: Container(
        child: FadingEdgeScrollView.fromScrollView(
          child: ListView.builder(
              controller: _controller,
              padding: const EdgeInsets.all(8),
              itemCount: boolAnswerList.length,
              itemBuilder: (BuildContext context, int index) {
                return _listTile(index, context, boolAnswerList);
              }),
        ),
      ),
    );
  }

  Widget _listTile(index, context, boolAnswerList) {
    Color borderColor;
    Color tileColor;
    String category = Provider.of<GameSession>(context, listen: false)
        .gameQuestions[index]
        .category;
    Color categoryColor = Themes.category(category).color;
    IconData icon = Themes.category(category).icon;
    if (boolAnswerList[index]) {
      borderColor = Themes.colors.green;
      tileColor = Themes.colors.greenLight;
    } else {
      borderColor = Themes.colors.red;
      tileColor = Themes.colors.redLight;
    }
    return InkWell(
      onTap: () {
        Provider.of<GameSession>(context, listen: false).setblured();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 3, color: borderColor),
              color: tileColor),
          child: Row(
            children: [
              _iconCircle(icon, categoryColor),
              Container(width: 10),
              Text("Question: ${index + 1}"),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _circleRight(boolAnswerList[index], borderColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconCircle(IconData icon, Color categoryColor) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Themes.colors.grey),
            color: categoryColor,
            shape: BoxShape.circle),
        child: Center(
            child: Icon(
          icon,
          color: Themes.colors.white,
          size: 14,
        )),
      ),
    );
  }

  Widget _circleRight(bool bool, Color color) {
    double size = 15;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: bool
              ? Icon(Themes.icons.correct, size: 12, color: Themes.colors.white)
              : Icon(Themes.icons.wrong, size: 12, color: Themes.colors.white)),
    );
  }
}
