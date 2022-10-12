import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:provider/provider.dart';
import 'package:template/theme/theme.dart';
import 'package:template/components/category_button.dart';

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
                style: TextStyle(
                    color: Themes.colors.whiteBackground, fontSize: 35),
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
          style: TextStyle(color: Themes.colors.whiteBackground, fontSize: 15),
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
          style: TextStyle(color: Themes.colors.whiteBackground, fontSize: 15),
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
                      style: TextStyle(color: Themes.colors.whiteBackground),
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
          style: TextStyle(color: Themes.colors.whiteBackground, fontSize: 15),
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
                          color: Themes.colors.whiteBackground,
                        )
                      : Text(
                          timePerQuestion.toStringAsFixed(0),
                          style:
                              TextStyle(color: Themes.colors.whiteBackground),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Difficulty',
          style: TextStyle(color: Themes.colors.whiteBackground, fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //

            //
            Container(
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Themes.icons.lightenColor(Themes.colors.greenLight, 40),
                    Colors.green,
                    Themes.icons.darkenColor(Themes.colors.greenLight, 60)
                  ],
                  stops: [0, 0.5, 1],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Provider.of<GameSession>(context, listen: false)
                      .updateDifficulty("easy");
                },
                child: Text(
                  'Easy',
                  style: TextStyle(
                    color: Themes.colors.whiteBackground,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            //

            //
            Container(
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Themes.icons.lightenColor(Themes.colors.yellowLight, 40),
                    Colors.yellow,
                    Themes.icons.darkenColor(Themes.colors.yellowLight, 60)
                  ],
                  stops: [0, 0.5, 1],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Provider.of<GameSession>(context, listen: false)
                      .updateDifficulty("medium");
                },
                child: Text(
                  'Medium',
                  style: TextStyle(
                    color: Themes.colors.whiteBackground,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            //

            //
            Container(
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Themes.icons.lightenColor(Themes.colors.redLight, 40),
                    Colors.red,
                    Themes.icons.darkenColor(Themes.colors.redLight, 60)
                  ],
                  stops: [0, 0.5, 1],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Provider.of<GameSession>(context, listen: false)
                      .updateDifficulty("hard");
                },
                child: Text(
                  'Hard',
                  style: TextStyle(
                    color: Themes.colors.whiteBackground,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            //

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
              Themes.icons.lightenColor(Themes.colors.blueLight, 40),
              Themes.icons.darkenColor(Themes.colors.blueLight, 60)
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
            style: TextStyle(color: Themes.colors.whiteBackground),
          ),
        ),
      ),
    );
  }
}
