import 'dart:convert';

import 'package:http/http.dart' as http;
import 'settings.dart';
import 'question.dart';

class HttpConection {
  late Settings settings;
  late List listaMedQuestion = [];
  final String url = 'https://the-trivia-api.com/api/questions';
  // Huge thanks to Will Fry who created this open API!

  Future getQuestions({required Settings settings}) async {
    List<Question> questionList = [];
    String path = "?";

    path += pathToCategorys(settings);
    path += pathToDifficulty(settings);
    path += pathToNumberOfQuestions(settings);

    http.Response response = await http.get(Uri.parse('$url$path'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (var question in data) {
        questionList.add(Question.fromJson(question));
      }
    }

    return questionList;
  }

  String pathToDifficulty(Settings settings) {
    return '&difficulty=${settings.difficulty}';
  }

  String pathToCategorys(Settings settings) {
    if (settings.categorys.isEmpty) {
      return "";
    }
    String categories = '&categories=';
    for (String category in settings.categorys) {
      categories += ',$category';
    }
    return categories;
  }

  String pathToNumberOfQuestions(Settings settings) {
    if (settings.numberOfQuestions > 0) {
      return '&limit=${settings.numberOfQuestions}';
    }
    return '&limit=10';
  }
}
