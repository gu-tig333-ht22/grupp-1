import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class QuestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CountDownTimer(),
              SizedBox(height: 30),
              Text(
                // X/X SKA ERSÄTTAS MED INDEXPOSITION I FRÅGELISTA SAMT VÄRDE PÅ ANTAL FRÅGOR I SETTINGS
                "Question x/x",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Container(
                //SKA ERSÄTTAS MED FRÅGEKORT
                color: Colors.grey,
                width: 300,
                height: 250,
                child: const Text(
                  'Här kommer ett snyggt frågekort',
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
            ],
          ),
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Time left',
        ),
        SizedBox(height: 15),
        CircularCountDownTimer(
          duration: 10, //SKA FÅ VÄRDE FRÅN SETTINGS
          width: 100,
          height: 100,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.purpleAccent[100]!,
          fillGradient: LinearGradient(colors: [
            Color.fromARGB(255, 61, 247, 107),
            Color.fromARGB(255, 20, 66, 31)
          ]),
          backgroundColor: Color.fromARGB(255, 41, 67, 88),
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              inherit: false),
          isReverse: true,
          isReverseAnimation: true,
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
