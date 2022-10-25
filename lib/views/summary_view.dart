import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/gradient_circle.dart';
import 'package:template/data/game_session.dart';
import 'package:template/data/highscore.dart';
import 'package:template/theme/theme.dart';
import 'package:template/components/card.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/views/highscore_view.dart';
import 'package:template/views/settings_view.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:template/data/string_extension.dart';
import 'package:template/views/loading_screen.dart';
import '../data/game_session.dart';
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
                Text("Summary", style: Themes.textStyle.headline1),
                const SizedBox(height: 15),
                ScoreTable(),
                const SizedBox(height: 30),
                Text(
                  '${gameSession.chosenDifficulty.capitalize()} difficulty',
                  style: Themes.textStyle.headline2,
                ),
                SummaryTable(),
                const SizedBox(height: 15),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    gameSession.settings.standardSettings
                        ? AddNameButton()
                        : const SizedBox(
                            height: 10,
                          ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NewGameButton(),
                        Container(
                          width: 10,
                        ),
                        ToMenuButton(),
                      ],
                    )
                  ],
                )
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
          const SizedBox(height: 5),
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
        style: Themes.textStyle.headline2,
      ),
      width: 135,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, _, __) => LoadingView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero));
      },
    );
  }
}

class ToMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationButton(
      text: Text(
        "Menu",
        style: Themes.textStyle.headline2,
      ),
      width: 135,
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

class AddNameButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return NavigationButton(
        text: Text(
          'Add to highscore',
          style: Themes.textStyle.headline1,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: ((BuildContext context) => AddNameDialog()));
        },
        width: 280,
        height: 50,
        color: Themes.colors.blueDark);
  }
}

class AddNameDialog extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(15),
      actionsPadding: const EdgeInsets.all(15),
      title: Text('Add your player name.'),
      content: TextField(
        controller: nameController,
        maxLength: 25,
      ),
      actions: [
        Row(
          children: [
            Consumer<GameSession>(
                builder: (BuildContext context, gameSession, child) {
              return NavigationButton(
                  text: Text('Add name', style: Themes.textStyle.headline3),
                  onPressed: () {
                    gameSession.player
                        .setPlayerName(nameController.text); // Set player name
                    Provider.of<Highscore>(context, listen: false)
                        .setShowPlayAgain(
                            true); // För att visa "spela-igen"-knapp
                    Provider.of<Highscore>(context, listen: false).addNewScore(
                        // Add data to highscore database
                        name: gameSession.player.name,
                        score: gameSession.player.score,
                        difficulty: gameSession.settings.difficulty,
                        longestStreak: gameSession.player.longestStreak,
                        numberOfQuestions:
                            gameSession.settings.numberOfQuestions,
                        timePerQuestion: gameSession.settings.timePerQuestion,
                        categories: gameSession.settings.categories);

                    Provider.of<Highscore>(context, listen: false)
                        .setDifficultyToView(Provider.of<GameSession>(context,
                                listen: false)
                            .chosenDifficulty); // Visa vilken svårighet som ska visas direkt i highscore

                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => HighscoreView(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero),
                        ((route) => false));
                  },
                  width: 100,
                  height: 30,
                  color: Themes.colors.blueDark);
            }),
            const Spacer(),
            NavigationButton(
                text: Text('Cancel', style: Themes.textStyle.headline3),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: 100,
                height: 30,
                color: Themes.colors.blueDark),
          ],
        ),
      ],
    );
  }
}
