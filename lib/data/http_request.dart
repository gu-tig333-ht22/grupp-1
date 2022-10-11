import 'dart:convert';

import 'package:http/http.dart' as http;
import 'settings.dart';
import 'question.dart';

class HttpConection {
  late Settings settings;
  late List listaMedQuestion = [];
  final String url = 'https://the-trivia-api.com/api/questions';
  // Huge thanks to Will Fry who created this open API!

  /// Gets a set of answers from the trivia Api. This function recuires
  /// an object of setting that contains game settings. It returns a
  /// complete list of Question objects.
  Future getQuestions({required Settings settings}) async {
    List<Question> questionList = [];
    String path =
        '?${_pathToCategorys(settings)}${_pathToDifficulty(settings)}${_pathToNumberOfQuestions(settings)}';

    http.Response response = await http.get(Uri.parse('$url$path'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (var question in data) {
        questionList.add(Question.fromJson(question));
      }
    }
    return questionList;
  }

  String _pathToDifficulty(Settings settings) {
    return '&difficulty=${settings.difficulty}';
  }

  String _pathToCategorys(Settings settings) {
    if (settings.categorys.isEmpty) {
      return "";
    }
    String categories = '&categories=';
    for (String category in settings.categorys) {
      categories += ',$category';
    }
    return categories;
  }

  String _pathToNumberOfQuestions(Settings settings) {
    if (settings.numberOfQuestions > 0) {
      return '&limit=${settings.numberOfQuestions}';
    }
    return '&limit=10';
  }
}
