import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:provider/provider.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/theme/theme.dart';
import '../data/game_session.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: (Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Singleplayer',
                style: TextStyle(color: Themes.colors.white, fontSize: 35),
              ),
              const SizedBox(
                height: 70,
              ),
              CategoryRow(),
              const SizedBox(
                height: 20,
              ),
              QuestionSlider(),
              const SizedBox(
                height: 20,
              ),
              TimeSlider(),
              const SizedBox(
                height: 20,
              ),
              DifficultyRow(),
              const Spacer(),
              StartButton(),
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
          //style: Themes.textStyle.answerText, Varför funkar inte det?
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
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Themes.functions.lightenColor(categoryColor, 40),
                categoryColor,
                Themes.functions.darkenColor(categoryColor, 60)
              ],
              stops: const [
                0,
                0.2,
                0.9,
              ],
            ),
          ),
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

class QuestionSlider extends StatefulWidget {
  @override
  State<QuestionSlider> createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<QuestionSlider> {
  double timePerQuestion = 10;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Questions',
          style: TextStyle(color: Themes.colors.white, fontSize: 15),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Themes.colors.grey,
                        ),
                        child: Center(
                          child: SliderTheme(
                            data: SliderThemeData(trackHeight: 6),
                            child: Slider(
                                activeColor: Themes.colors.blueLight,
                                inactiveColor: Themes.colors.blueDark,
                                value: timePerQuestion,
                                divisions: 49,
                                onChanged: (value) {
                                  setState(() {
                                    timePerQuestion = value;
                                  });
                                },
                                min: 1,
                                max: 50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Themes.colors.blueDark,
                      border: Border.all(color: Themes.colors.grey, width: 4),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      timePerQuestion.toStringAsFixed(0),
                      style: TextStyle(color: Themes.colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}

class TimeSlider extends StatefulWidget {
  @override
  State<TimeSlider> createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double timePerQuestion = 20;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time per question',
          style: TextStyle(color: Themes.colors.white, fontSize: 15),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Themes.colors.grey,
                        ),
                        child: Center(
                          child: SliderTheme(
                            data: SliderThemeData(trackHeight: 6),
                            child: Slider(
                                activeColor: Themes.colors.blueLight,
                                inactiveColor: Themes.colors.blueDark,
                                value: timePerQuestion,
                                divisions: 60,
                                onChanged: (value) {
                                  setState(() {
                                    timePerQuestion = value;
                                  });
                                },
                                min: 1,
                                max: 61),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Themes.colors.blueDark,
                      border: Border.all(color: Themes.colors.grey, width: 4),
                      borderRadius: BorderRadius.circular(50)),
                  child: timePerQuestion == 61
                      ? Icon(
                          OctIcons.infinity_16,
                          size: 15,
                          color: Themes.colors.white,
                        )
                      : Text(
                          timePerQuestion.toStringAsFixed(0),
                          style: TextStyle(color: Themes.colors.white),
                        ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}

class DifficultyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String difficulty = Provider.of<GameSession>(context).chosenDifficulty;
    double easyOpacity = 0.4;
    double mediumOpacity = 1;
    double hardOpacity = 0.4;

    if (difficulty == "easy") {
      easyOpacity = 1;
      mediumOpacity = 0.4;
      hardOpacity = 0.4;
    }

    if (difficulty == "medium") {
      easyOpacity = 0.4;
      mediumOpacity = 1;
      hardOpacity = 0.4;
    }

    if (difficulty == "hard") {
      easyOpacity = 0.4;
      mediumOpacity = 0.4;
      hardOpacity = 1;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Difficulty: $difficulty',
          style: TextStyle(color: Themes.colors.white, fontSize: 15),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //

            //
            NavigationButton(
                text: Text("Easy", style: Themes.textStyle.headline3),
                width: 80,
                height: 40,
                color: Themes.colors.green.withOpacity(easyOpacity),
                onPressed: () =>
                    Provider.of<GameSession>(context, listen: false)
                        .updateDifficulty("easy")),

            //

            NavigationButton(
                text: Text("Medium", style: Themes.textStyle.headline3),
                width: 80,
                height: 40,
                color: Themes.colors.yellow.withOpacity(mediumOpacity),
                onPressed: () =>
                    Provider.of<GameSession>(context, listen: false)
                        .updateDifficulty("medium")),

            //

            NavigationButton(
                text: Text("Hard", style: Themes.textStyle.headline3),
                width: 80,
                height: 40,
                color: Themes.colors.red.withOpacity(hardOpacity),
                onPressed: () =>
                    Provider.of<GameSession>(context, listen: false)
                        .updateDifficulty("hard")),

            //
          ],
        ),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Themes.functions.lightenColor(Themes.colors.blueLight, 40),
              Themes.functions.darkenColor(Themes.colors.blueLight, 60)
            ],
            stops: const [
              0,
              1,
            ],
          ),
        ),
        child: TextButton(
          onPressed: (() {}),
          child: Text(
            'Start',
            style: TextStyle(color: Themes.colors.white),
          ),
        ),
      ),
    );
  }
}
