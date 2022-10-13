import 'package:flutter/material.dart';
import 'package:template/data/question.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/answer_view.dart';
import 'package:template/test/test_file.dart';

class QuestionCard extends StatelessWidget {
  Question question;

  QuestionCard(this.question);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    List<String> options = question.allAnswersInRandomOrder;
    Color categoryColor = Themes.category(question.category).color;
    Color backgroundColor = Themes.colors.whiteBackground;
    IconData categoryIcon = Themes.category(question.category).icon;

    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 12, right: 12),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(width: 10, color: categoryColor)),
      height: deviceHeight * 0.65,
      width: deviceWidth * 0.85,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryIcon,
                color: categoryColor.withOpacity(0.2),
                size: 120,
              ),
            ],
          ),
          Column(children: [
            Text(
              style: Themes.textStyle.questionText,
              '${question.question}',
            ),
            const Spacer(),
            Column(children: [
              OptionsRow('A', options[0], categoryColor, question),
              OptionsRow('B', options[1], categoryColor, question),
              OptionsRow('C', options[2], categoryColor, question),
              OptionsRow('D', options[3], categoryColor, question),
            ])
          ])
        ],
      ),
    );
  }
}

class OptionsRow extends StatelessWidget {
  String option = 'Option is missing.';
  String leadingLetter;
  Color categoryColor;
  Color borderColor = Themes.colors.grey;
  Color tileColor = Themes.colors.whiteBackground;
  Color circleColor = Themes.colors.whiteBackground;
  Question question;
  var icon = null;

  OptionsRow(
      this.leadingLetter, this.option, this.categoryColor, this.question);

  @override
  Widget build(BuildContext context) {
    if (listAnswersTest.asMap().containsKey(question.index)) {
      if (listAnswersTest[question.index] == option) {
        borderColor = Themes.colors.red;
        tileColor = Themes.colors.redLight;
        circleColor = Themes.colors.red;
        icon = Icon(
          Themes.icons.wrong,
          color: Colors.white,
        );
      }
      if (option == question.correctAnswer) {
        borderColor = Themes.colors.green;
        tileColor = Themes.colors.greenLight;
        circleColor = Themes.colors.greenLight;
      }
    }

    return Material(
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          tileColor: tileColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 2, color: borderColor)),
          contentPadding:
              const EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
          title: Row(children: [
            CircleAvatar(
              backgroundColor: categoryColor,
              radius: 14,
              child: Text(
                leadingLetter,
                style: Themes.textStyle.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                style: Themes.textStyle.answerText,
                option,
              ),
            ),
          ]),
          trailing: Container(
            child: icon,
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: circleColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: borderColor),
            ),
          ),
          onTap: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AnswerView()));
          }),
        ),
      ),
    );
  }
}
