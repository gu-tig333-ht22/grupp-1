import 'dart:convert';

import 'package:template/data/question.dart';

import 'http_request.dart';
import 'settings.dart';

void main() {
  Settings testSettings = Settings(
      numberOfQuestions: 10,
      selectedCategorys: [],
      difficylty: "medium",
      timePerQuestion: 10);
  HttpConection myConnection = HttpConection();

  void getList() async {
    List<Question> nyLista =
        await myConnection.getQuestions(settings: testSettings);
    for (var x in nyLista) {
      print(x.question);
      print(x.allAnswersInRandomOrder);
    }
  }

  getList();
  // var test = {
  //   "category": "History",
  //   "id": "622a1c377cc59eab6f95041d",
  //   "correctAnswer": "1985",
  //   "incorrectAnswers": ["1979", "1965", "1950"],
  //   "question":
  //       "In What Year Did Mikhail Gorbachev Become Leader Of The Soviet Union?",
  //   "tags": ["russia", "cold_war", "leaders", "politics", "history"],
  //   "type": "Multiple Choice",
  //   "difficulty": "medium",
  //   "regions": []
  // };
  // Question testQ = Question.fromJson(test);
  // print(testQ.correctAnswer);
}
