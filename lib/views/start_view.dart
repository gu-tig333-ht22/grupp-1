import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            const Text('Quizter Pettersson'),
            Spacer(),
            ElevatedButton(
                onPressed: () {}, child: const Text('Single Player')),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: const Text('Multiplayer')),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: const Text('Highscore')),
            SizedBox(height: 150)
          ],
        ),
      ),
    );
  }
}
