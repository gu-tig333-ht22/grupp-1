import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/highscore.dart';
import 'package:template/data/string_extension.dart';
import 'package:template/theme/theme.dart';

import '../components/nav_button.dart';

class HighscoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Column(
        children: [
          Text(
            "Highscore",
            style: Themes.textStyle.headline1,
          ),
          DifficultyRow(),
        ],
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
            _Difficultybutton(
              context,
              "Easy",
              difficulty,
              Themes.colors.green,
            ),
            SizedBox(width: 20),
            _Difficultybutton(
              context,
              "Medium",
              difficulty,
              Themes.colors.yellow,
            ),
            SizedBox(width: 20),
            _Difficultybutton(
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

  Widget _Difficultybutton(
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
        onPressed: () => Provider.of<Highscore>(context, listen: false)
            .setDifficultyToView(newDifficulty.toLowerCase()),
      ),
    );
  }
}

Widget _highscoreListBuilder(context) {
  List currentList =
      Provider.of<Highscore>(context, listen: true).getChosenHighscores();
  return Expanded(
    child: Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          //itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return CustomListTile(
                playerName: currentList[index]["name"],
                score: currentList[index]["score"]);
          }),
    ),
  );
}

class CustomListTile extends StatelessWidget {
  late String score = "";
  late String playerName = "";

  CustomListTile({String this.score = "", String this.playerName = ""});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 3, color: Themes.colors.blueDark),
            color: Themes.colors.white),
        child: Row(
          children: [
            Container(width: 10),
            Text(playerName), // skall visa spelaren namn
            //_categoryIconLeft(categoryIcon, categoryColor), // lägg till valda kategorier?
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(score), // skall visa highscore
              ),
            )
          ],
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
