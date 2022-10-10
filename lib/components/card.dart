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
    Color categoryColor = Colors.purple;

    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(35),
          border: Border.all(width: 12, color: categoryColor)),
      height: deviceHeight * 0.5,
      width: deviceWidth * 0.8,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dangerous_outlined,
                color: categoryColor.withOpacity(0.2),
                size: 120,
              ),
            ],
          ),
          Column(children: [
            Text('${question.question}'),
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
  Color borderColor;

  OptionsRow(this.leadingLetter, this.option, this.borderColor);

  @override
  Widget build(BuildContext context) {
    var borderColor = const Color(0xff465E77);

    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 2, color: borderColor)),
      contentPadding:
          const EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
      title: Row(children: [
        CircleAvatar(
          backgroundColor: Colors.purple,
          radius: 14,
          child: Text(
            leadingLetter,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(option),
      ]),
      trailing: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
        ),
      ),
      onTap: (() {}),
    );
  }
}
