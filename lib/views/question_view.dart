import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:template/components/card.dart';

import 'dart:math' as math;

import 'package:template/test/test_file.dart';

class QuestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            CountDownTimer(),
            //const SizedBox(height: 30),
            const Spacer(),
            const Text(
              // X/X SKA ERSÄTTAS MED INDEXPOSITION I FRÅGELISTA SAMT VÄRDE PÅ ANTAL FRÅGOR I SETTINGS
              "Question x/x",
            ),
            const SizedBox(height: 10),
            QuestionCard(testQuestion1),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Time left',
        ),
        const SizedBox(height: 15),
        CircularCountDownTimer(
          duration: 5, //SKA FÅ VÄRDE FRÅN SETTINGS
          width: 100,
          height: 100,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.blue, //Måste finnas med men används inte...
          fillGradient: const SweepGradient(
            colors: [Colors.blue, Colors.lightBlue, Colors.red],
            stops: [
              0.0,
              0.5,
              0.7,
            ],
            startAngle: 3 * math.pi / 2,
            endAngle: 7 * math.pi / 2,
            tileMode: TileMode.repeated,
          ),

          backgroundColor: const Color.fromARGB(255, 41, 67, 88),
          backgroundGradient: null,
          strokeWidth: 20.0,
          textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              inherit: false),
          isReverse: true,
          isTimerTextShown: true,
          autoStart: true,
          onComplete: () {
            //SÄTT FEL SVAR/NOLL POÄNG OCH GÅ VIDARE TILL NÄSTA FRÅGA
          },
        )
      ],
    );
  }
}
