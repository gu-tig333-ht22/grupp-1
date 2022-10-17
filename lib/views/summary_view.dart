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

List<bool> listAnswers = [
  true,
  false,
  false,
  true,
  false,
  true,
  false,
  false,
  true,
  false,
];
List categories =
    ThemeCategories().listCategories + ThemeCategories().listCategories;

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
                _scoreTable(),
                Container(height: 30),
                _summaryTable(),
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

  Widget _scoreTable() {
    int playerScore = 13;
    int settingsQuestions = 20;
    int wrongAnswers = (settingsQuestions - playerScore);
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
              number: playerScore,
              text: "Wrong \nAnswers",
              color: Themes.colors.red),
          Container(
            width: spaceBetween,
          ),
          _scoreCircle(
              number: playerScore, text: "Total", color: Themes.colors.grey)
        ],
      ),
    );
  }

  Widget _scoreCircle(
      {required int number, required String text, required Color color}) {
    return Column(
      children: [
        GradientCircle(
            child: Text(
              number.toString(),
              style: Themes.textStyle.headline1,
            ),
            color: color,
            size: 80),
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

  Widget _summaryTable() {
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
          _listView(listAnswers),
        ],
      ),
    );
  }

  Widget _listView(listAnswers) {
    return Expanded(
      child: Container(
        child: FadingEdgeScrollView.fromScrollView(
          child: ListView.builder(
              controller: _controller,
              padding: const EdgeInsets.all(8),
              itemCount: listAnswers.length,
              itemBuilder: (BuildContext context, int index) {
                return _listTile(index, context);
              }),
        ),
      ),
    );
  }

  Widget _listTile(index, context) {
    Color color;
    Color colorLight;

    if (listAnswers[index]) {
      color = Themes.colors.green;
      colorLight = Themes.colors.greenLight;
    } else {
      color = Themes.colors.red;
      colorLight = Themes.colors.redLight;
    }
    return InkWell(
      onTap: () {
        Provider.of<GameSession>(context, listen: false).setblured();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 4),
        child: Container(
          child: Row(
            children: [
              _iconCircle(index),
              Container(width: 10),
              Text("Question: " + (index + 1).toString()),
              Expanded(
                child: Align(
                  child: _circleRight(listAnswers[index], color),
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 3, color: color),
              color: colorLight),
        ),
      ),
    );
  }

  Widget _iconCircle(index) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Themes.colors.grey),
            color: categories[index].color,
            shape: BoxShape.circle),
        child: Center(
            child: Icon(
          categories[index].icon,
          color: Themes.colors.white,
          size: 14,
        )),
      ),
    );
  }

  Widget _circleRight(bool bool, Color color) {
    double size = 15;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          width: size,
          height: size,
          child: bool
              ? Icon(Themes.icons.correct, size: 12, color: Themes.colors.white)
              : Icon(Themes.icons.wrong, size: 12, color: Themes.colors.white),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
    );
  }
}
