import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/test/test_file.dart';
import 'package:template/components/card.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/views/settings_view.dart';
import 'package:template/views/start_view.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

import '../data/question.dart';

class SummaryView extends StatelessWidget {
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
                ScoreTable(),
                Container(height: 30),
                SummaryTable(),
                Container(
                  height: 30,
                ),
                NewGameButton(),
              ],
            ),
          ),
          ShowBluredAndCard()
        ],
      ),
    ));
  }
}

class ScoreTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int playerScore =
        Provider.of<GameSession>(context, listen: false).player.score;
    int totalScore =
        Provider.of<GameSession>(context, listen: false).gameQuestions.length;
    int wrongAnswers = (totalScore - playerScore);

    double spaceBetween = 15;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _scoreCircle(playerScore, "Correct \nAnswers", Themes.colors.green),
        Container(
          width: spaceBetween,
        ),
        _scoreCircle(wrongAnswers, "Wrong \nAnswers", Themes.colors.red),
        Container(
          width: spaceBetween,
        ),
        _scoreCircle(totalScore, "Total", Themes.colors.grey)
      ],
    );
  }

  Widget _scoreCircle(int number, String textBelow, Color color) {
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
          textBelow,
          style: Themes.textStyle.headline3,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class SummaryTable extends StatelessWidget {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
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
    int questionListLenght = Provider.of<GameSession>(context, listen: false)
        .getGameQuestions
        .length;
    return Expanded(
      child: Container(
        child: FadingEdgeScrollView.fromScrollView(
          child: ListView.builder(
              controller: _controller,
              padding: const EdgeInsets.all(8),
              itemCount: questionListLenght,
              itemBuilder: (BuildContext context, index) {
                return CustomListTile(index: index);
              }),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  late int index;
  CustomListTile({required int this.index});
  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color tileColor;
    IconData tileIcon;
    String category = Provider.of<GameSession>(context, listen: false)
        .getGameQuestions[index]
        .category;
    Color categoryColor = Themes.category(category).color;
    IconData categoryIcon = Themes.category(category).icon;
    String playerAnswer = Provider.of<GameSession>(context, listen: false)
        .getPlayerAnswerSummaryView(index: index);
    if (playerAnswer == "No answer") {
      borderColor = Themes.colors.red;
      tileColor = Themes.colors.redLight;
      tileIcon = Themes.icons.timeout;
    } else if (playerAnswer == "Correct answer") {
      borderColor = Themes.colors.green;
      tileColor = Themes.colors.greenLight;
      tileIcon = Themes.icons.correct;
    } else {
      borderColor = Themes.colors.red;
      tileColor = Themes.colors.redLight;
      tileIcon = Themes.icons.wrong;
    }
    return InkWell(
      onTap: () {
        Provider.of<GameSession>(context, listen: false)
            .toggleBluredSummaryView();
        Provider.of<GameSession>(context, listen: false)
            .setIndexSummaryView(index: index);
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
              _categoryIconLeft(categoryIcon, categoryColor),
              Container(width: 10),
              Text("Question: ${index + 1}"),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _tileIconRight(tileIcon, borderColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryIconLeft(IconData categoryIcon, Color categoryColor) {
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
          categoryIcon,
          color: Themes.colors.white,
          size: 14,
        )),
      ),
    );
  }

  Widget _tileIconRight(IconData tileIcon, Color color) {
    double size = 15;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(tileIcon, size: 12, color: Themes.colors.white)),
    );
  }
}

class ShowBluredAndCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool showBLuredAndCard =
        Provider.of<GameSession>(context, listen: false).blured;
    if (showBLuredAndCard == true) {
      int index = Provider.of<GameSession>(context, listen: false)
          .getIndexSummaryView();
      Question question =
          Provider.of<GameSession>(context, listen: false).gameQuestions[index];

      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<GameSession>(context, listen: false)
                  .toggleBluredSummaryView();
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
              ),
            ),
          ),
          Center(
              child: QuestionCard(
            question: question,
            answerable: false,
          ))
        ],
      );
    } else {
      return Container(); // Returnerar en "osynlig/tom" container
    }
  }
}

class NewGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationButton(
      text: Text(
        "New game",
        style: Themes.textStyle.headline1,
      ),
      width: 250,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
                pageBuilder: (context, _, __) => SettingsView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero),
            ((route) => false));
      },
    );
  }
}
