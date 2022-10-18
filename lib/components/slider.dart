import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:provider/provider.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';
import '../data/game_session.dart';

class SliderModel extends StatelessWidget {
  late Function onchanged;
  late Function getWidget;
  late Function getValue;
  late double max;

  SliderModel(
      {required this.onchanged,
      required this.getValue,
      required this.max,
      required this.getWidget});

  @override
  Widget build(BuildContext context) {
    double numberOfQuestions = getValue();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient:
                            Themes.functions.applyGradient(Themes.colors.grey)),
                    child: Center(
                      child: SliderTheme(
                        data: SliderThemeData(trackHeight: 6),
                        child: Slider(
                            activeColor: Themes.colors.blueLight,
                            inactiveColor: Themes.colors.blueDark,
                            value: numberOfQuestions,
                            divisions: (max - 1).toInt(),
                            onChanged: (value) {
                              numberOfQuestions = value;
                              onchanged(value);
                            },
                            min: 1,
                            max: max),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  gradient: Themes.functions.applyGradient(Themes.colors.grey),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      gradient: Themes.functions
                          .applyGradient(Themes.colors.blueDark),
                      border: Border.all(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: getWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
