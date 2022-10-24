import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/highscore.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings_view.dart';
import 'package:template/views/start_view.dart';

import '../components/nav_button.dart';

class HighscoreView extends StatelessWidget {
  final _controller = ScrollController();

  HighscoreView({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<Highscore>(context, listen: true).fetchScores();
    return ScaffoldWithBackground(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Text(
              "Highscore",
              style: Themes.textStyle.headline1,
            ),
            const SizedBox(height: 15),
            DifficultyRow(),
            const SizedBox(height: 15),
            _highscoreListBuilder(context),
            _playAgainButton(context),
            const SizedBox(height: 15),
            _backToMenuButton(context),
          ],
        ),
      ),
    );
  }

  Widget _playAgainButton(context) {
    if (Provider.of<Highscore>(context, listen: false).showPlayAgain) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: NavigationButton(
          text: Text(
            "Play again",
            style: Themes.textStyle.headline1,
          ),
          width: 250,
          height: 50,
          color: Themes.colors.blueDark,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => SettingsView(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero));
          },
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _backToMenuButton(context) {
    return NavigationButton(
      text: Text(
        "Back to menu",
        style: Themes.textStyle.headline1,
      ),
      width: 250,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (context, _, __) => StartView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero));
      },
    );
  }

  Widget _highscoreListBuilder(context) {
    List currentList =
        Provider.of<Highscore>(context, listen: true).getChosenHighscores();
    return Expanded(
      child: FadingEdgeScrollView.fromScrollView(
        child: ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.all(8),
          itemCount: currentList.length,
          itemBuilder: (BuildContext context, index) {
            return CustomListTile(player: currentList[index], index: index);
          },
        ),
      ),
    );
  }
}

class DifficultyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String difficulty =
        Provider.of<Highscore>(context, listen: true).difficultyToView;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _difficultyButton(
              context,
              "Easy",
              difficulty,
              Themes.colors.green,
            ),
            SizedBox(width: 20),
            _difficultyButton(
              context,
              "Medium",
              difficulty,
              Themes.colors.yellow,
            ),
            SizedBox(width: 20),
            _difficultyButton(
              context,
              "Hard",
              difficulty,
              Themes.colors.red,
            ),
          ],
        ),
        //_highscoreListBuilder(context)
      ],
    );
  }

  Widget _difficultyButton(
      context, String newDifficulty, String setDifficulty, color) {
    double opacity = 0.4;
    if (newDifficulty.toLowerCase() == setDifficulty) {
      opacity = 1;
    }
    return Opacity(
      opacity: opacity,
      child: NavigationButton(
        text: Text(newDifficulty, style: Themes.textStyle.headline3),
        width: 80,
        height: 40,
        color: color,
        onPressed: () {
          Provider.of<Highscore>(context, listen: false)
              .setDifficultyToView(newDifficulty.toLowerCase());
          Provider.of<Highscore>(context, listen: false)
              .fetchScores(difficulty: newDifficulty.toLowerCase());
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  late Map player;
  late int index;

  CustomListTile(
      {super.key, required Map this.player, required int this.index});
  @override
  Widget build(BuildContext context) {
    TextStyle style = Themes.textStyle.highscoreText;
    Color tileColor = Themes.colors.white;
    double tileHeight = 30;
    if (player["key"] ==
        Provider.of<Highscore>(context, listen: false).lastKey) {
      style = Themes.textStyle.highscoreTextBold;
      tileColor = Themes.colors.yellowLight;
      tileHeight = 35;
      if (index == 0 &&
          Provider.of<Highscore>(context, listen: false).showPlayAgain ==
              true) {
        Themes.soundeffect.firstPlace();
      }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        height: tileHeight,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 3, color: Themes.colors.blueDark),
            color: tileColor),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 25,
              child: Text(
                textAlign: TextAlign.end,
                "${index + 1}",
                style: style,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              player["name"],
              style: style,
            ), // skall visa spelaren namn
            //_categoryIconLeft(categoryIcon, categoryColor), // lägg till valda kategorier?
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                    "${player["score"]} / ${player["numberOfQuestions"]}",
                    style: style), // skall visa highscore
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
