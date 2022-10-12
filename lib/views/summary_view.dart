import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

List<bool> listAnswers = [
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true
];

class SummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text("Scorescreen", style: Themes.textStyle.headline1),
          _scoreTable(),
          Expanded(child: _summaryTable()),
        ],
      ),
    ));
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
        Themes.icons.circle(
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
    return Column(
      children: [
        Text(
          "Summary",
          style: Themes.textStyle.headline2,
        ),
        Container(
          height: 0,
        ),
        _listView(listAnswers)
      ],
    );
  }

  Widget _listView(listAnswers) {
    return Expanded(
      child: Material(
        color: Color.fromARGB(0, 255, 255, 255),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: listAnswers.length,
            itemBuilder: (BuildContext context, int index) {
              return _listTile(index);
            }),
      ),
    );
  }

  Widget _listTile(index) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: listAnswers[index]
          ? Themes.colors.greenLight
          : Themes.colors.redLight,
      leading: Text("Test"),
    );
  }
}
