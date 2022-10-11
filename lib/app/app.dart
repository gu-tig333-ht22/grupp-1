import 'package:flutter/material.dart';
import 'package:template/components/card.dart';
import 'package:template/views/answer_view.dart';
import 'package:template/views/question_view.dart';
import 'package:template/views/settings_view.dart';
import 'package:template/views/start_view.dart';
import 'package:template/test/test_file.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: QuestionView()),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
