import 'package:http/http.dart' as http;
import 'settings.dart';
import 'question.dart';

class HttpConection {
  late Settings settings;
  final String url = 'https://the-trivia-api.com/api/questions';
  // Huge thanks to Will Fry who created this open API!

  Future<List<Question>> getQuestions({required Settings settings}) async {
    List<Question> questionList = [];
    String path = "?";

    http.Response response = await http.get(Uri.parse('$url'));

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
    for (String category in settings.categorys) {}
    return categories;
  }
}
