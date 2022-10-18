import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:provider/provider.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';
import '../data/game_session.dart';
import 'package:template/components/slider.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: (Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(height: 30),
              Text(
                'Singleplayer',
                style: TextStyle(color: Themes.colors.white, fontSize: 35),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Provider.of<GameSession>(context, listen: false)
                          .resetSettings();
                    },
                    color: Themes.colors.backgroundDark,
                    textColor: Colors.white,
                    child: Icon(
                      Themes.icons.reset,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              CategoryRow(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Number of questions',
                  style: TextStyle(color: Themes.colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SliderModel(
                  onchanged: Provider.of<GameSession>(context, listen: false)
                      .updateNumberOfQuestion,
                  getValue: Provider.of<GameSession>(context, listen: true)
                      .getNumberOfQuestion,
                  getWidget: Provider.of<GameSession>(context, listen: false)
                      .getNumberOfQuestionSlider,
                  max: 50),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Time per question',
                  style: TextStyle(color: Themes.colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SliderModel(
                  onchanged: Provider.of<GameSession>(context, listen: false)
                      .updateTimePerQuestion,
                  getValue: Provider.of<GameSession>(context, listen: true)
                      .getTimePerQuestion,
                  getWidget: Provider.of<GameSession>(context, listen: false)
                      .getTimePerQuestionSlider,
                  max: 61),
              const SizedBox(
                height: 20,
              ),
              DifficultyRow(),
              const SizedBox(
                height: 20,
              ),
              NavigationButton(
                text: Text(
                  "Start",
                  style: Themes.textStyle.headline1,
                ),
                onPressed: () async {
                  Provider.of<GameSession>(context, listen: false).startGame();
                  await Future.delayed(const Duration(seconds: 2)); // quickfix
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => QuestionView(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero));
                },
                width: 250,
                height: 50,
                color: Themes.colors.blueDark,
              ),
              const Spacer(),
            ],
          ),
        ),
      )),
    );
  }
}

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themesCategory = ThemeCategories();
    List<ThemeCategory> categoryList = themesCategory.listCategories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(color: Themes.colors.white, fontSize: 15),
        ),
        GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 5),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
          children: categoryList
              .map(
                (category) => CategoryButton(category),
              )
              .toList(),
        ),
      ],
    );
  }
}

/// # Categorybutton
/// Builds a button for categories. Updates the categories selected in settings
class CategoryButton extends StatelessWidget {
  var category;
  CategoryButton(this.category, {super.key});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    List tempValdaKategorier =
        Provider.of<GameSession>(context, listen: true).chosenCategories;

    Color categoryColor = category.color;
    Color iconColor = Themes.colors.white;
    double opacity = 1;
    if (!tempValdaKategorier.contains(category.name)) {
      categoryColor = Themes.functions.lightenColor(categoryColor, 40);
      opacity = 0.40;
    }
    return InkWell(
      child: Opacity(
        opacity: opacity,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: Themes.functions.applyGradient(categoryColor)),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Center(
                  child: Icon(
                category.icon,
                color: iconColor, // vad skall det vara för färg?
              )),
            ),
          ),
        ),
      ),
      onTap: () {
        Provider.of<GameSession>(context, listen: false)
            .updateCategory(category.name);
      },
    );
  }
}

class DifficultyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String difficulty =
        Provider.of<GameSession>(context, listen: true).chosenDifficulty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Difficulty',
          style: TextStyle(color: Themes.colors.white, fontSize: 15),
        ),
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
        onPressed: () => Provider.of<GameSession>(context, listen: false)
            .updateDifficulty(newDifficulty.toLowerCase()),
      ),
    );
  }
}
