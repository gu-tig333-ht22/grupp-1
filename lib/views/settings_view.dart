import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:template/theme/theme.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: (Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text('Singleplayer'),
              CategoryRow(),
              TimeSlider(),
              QuestionSlider(),
              DifficultyRow(),
              Spacer(),
              StartButton(),
              Spacer(),
            ],
          ),
        ),
      )),
    );
  }
}

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
        ),
        GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 5),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[700],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[800],
            )
          ],
        ),
      ],
    );
  }
}

class QuestionSlider extends StatefulWidget {
  @override
  State<QuestionSlider> createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<QuestionSlider> {
  double timePerQuestion = 10;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Number of questions'),
        Row(
          children: [
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text(timePerQuestion.toStringAsFixed(0)))),
            Expanded(
              child: Slider(
                  value: timePerQuestion,
                  divisions: 49,
                  onChanged: (value) {
                    setState(() {
                      timePerQuestion = value;
                    });
                  },
                  min: 1,
                  max: 50),
            ),
          ],
        ),
      ],
    );
  }
}

class TimeSlider extends StatefulWidget {
  @override
  State<TimeSlider> createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double timePerQuestion = 10;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Time per question'),
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: timePerQuestion == 61
                      ? const Icon(
                          OctIcons.infinity_16,
                          size: 25,
                          color: Colors.black,
                        )
                      : Text(timePerQuestion.toStringAsFixed(0))),
            ),
            Expanded(
              child: Slider(
                  value: timePerQuestion,
                  divisions: 56,
                  onChanged: (value) {
                    setState(() {
                      timePerQuestion = value;
                    });
                  },
                  min: 5,
                  max: 61),
            ),
          ],
        ),
      ],
    );
  }
}

class DifficultyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Difficulty'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Easy')),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Medium')),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Hard')),
          ],
        ),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          ElevatedButton(onPressed: (() {}), child: const Text('Start game')),
    );
  }
}
