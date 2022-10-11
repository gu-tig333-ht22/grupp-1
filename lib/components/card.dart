import 'package:flutter/material.dart';
import 'package:template/data/question.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/answer_view.dart';

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
              OptionsRow('A', options[0], categoryColor),
              OptionsRow('B', options[1], categoryColor),
              OptionsRow('C', options[2], categoryColor),
              OptionsRow('D', options[3], categoryColor),
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

  OptionsRow(this.leadingLetter, this.option, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    var borderColor = Themes.colors.grey;

    return Material(
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
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
            width: 28,
            height: 28,
            decoration: BoxDecoration(
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
