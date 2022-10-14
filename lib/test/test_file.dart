import 'package:flutter/material.dart';
import 'package:template/components/card.dart';
import 'package:template/data/question.dart';

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

List<Widget> questions = [
  QuestionCard(testQuestion1),
  QuestionCard(testQuestion1),
  QuestionCard(testQuestion1),
  QuestionCard(testQuestion1),
];

List listAnswersTest = [];
