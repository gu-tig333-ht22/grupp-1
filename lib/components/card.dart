import 'package:flutter/material.dart';
import 'package:template/data/question.dart';

class QuestionCard extends StatelessWidget {
  Question question;

  QuestionCard(this.question);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    List<String> options = question.allAnswersInRandomOrder;

    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(35),
          border: Border.all(width: 12, color: Colors.purple)),
      height: deviceHeight * 0.5,
      width: deviceWidth * 0.8,
      child: Column(children: [
        Text('${question.question}'),
        const Spacer(),
        Column(children: [
          OptionsRow('A', options[0]),
          OptionsRow('B', options[1]),
          OptionsRow('C', options[2]),
          OptionsRow('D', options[3]),
        ])
      ]),
    );
  }
}

class OptionsRow extends StatelessWidget {
  String option = 'Option is missing.';
  String leadingLetter;

  OptionsRow(this.leadingLetter, this.option);

  @override
  Widget build(BuildContext context) {
    var borderColor = Colors.grey.shade700;

    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor, width: 2)),
      leading: CircleAvatar(
          radius: 14,
          child: Text(
            leadingLetter,
            textAlign: TextAlign.center,
          )),
      title: Text(option),
      trailing: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: borderColor),
          )),
      onTap: (() {}),
    );
  }
}
