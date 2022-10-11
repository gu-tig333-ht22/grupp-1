import 'package:flutter/material.dart';
import 'package:template/components/card.dart';
import 'package:template/test/test_file.dart';
import 'package:template/theme/theme.dart';

class AnswerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text('Score: 5',
                  style: TextStyle(fontSize: 40, color: ThemeColors().white)),
              const Spacer(),
              AnswerBalls(),
              // HÄR HAMNAR SCORE OCH BOLLAR
              //const SizedBox(height: 30),
              const Spacer(),
              const Text(
                // X/X SKA ERSÄTTAS MED INDEXPOSITION I FRÅGELISTA SAMT VÄRDE PÅ ANTAL FRÅGOR I SETTINGS
                "Question x/x", style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              QuestionCard(testQuestion1),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerBalls extends StatelessWidget {
  // LOGIK FÖR ATT SKAPA LISTAN SOM VISAS PÅ SKÄRMEN ÄR EJ IMPLEMENTERAD
  List<dynamic> ballData = [false, false, true, true, false, '6', '7'];

  @override
  Widget build(BuildContext context) {
    //var deviceWidth = MediaQuery.of(context).size.width;
    List<Widget> balls = ballData.map((ball) {
      if (ball == false) {
        return CircleAvatar(
            radius: 14,
            backgroundColor: ThemeColors().wronganswerRed,
            child: Icon(
              Icons.close,
              color: ThemeColors().white,
            ));
      }
      if (ball == true) {
        return CircleAvatar(
            radius: 14,
            backgroundColor: ThemeColors().correctanswerGreen,
            child: Icon(Icons.check, color: ThemeColors().white));
      } else {
        return CircleAvatar(
            radius: 14,
            backgroundColor: ThemeColors().darkBlue,
            child: Text(
              ball,
              style: TextStyle(color: ThemeColors().white),
            ));
      }
    }).toList();

    return Row(children: balls);
  }
}
