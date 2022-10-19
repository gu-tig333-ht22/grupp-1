import 'package:flutter/material.dart';
import 'package:template/components/card.dart';
import 'package:template/data/question.dart';
import 'package:provider/provider.dart';
import 'package:template/data/highscore.dart';

Question testQuestion1 = Question(
    id: '1',
    category: 'Sport & Leisure',
    correctAnswer: 'Grön',
    incorrectAnswers: [
      'Vita hästar är jättejättejättejättejättejättejättejättejättefina',
      'Grå',
      'Brun'
    ],
    question: 'Vilken färg kan hästar INTE ha?',
    difficulty: 'Ganska lätt',
    index: 0);

List listAnswersTest = [];

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<Highscore>(context, listen: true)
        .newScore(newName: "August", newScore: 12, difficulty: "medium");

    return Container(
      child: const Text("test"),
    );
  }
}
