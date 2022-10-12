import 'package:template/views/settings_view.dart';
import 'package:template/theme/theme.dart';

/// # Settings
/// Holds all parameters for a game.
///
/// int numberOfQuestions defaullt 10.
/// List<String> categorys defaullt [].
/// Stirng difficulty defaullt medium.
/// int timePerQuestion defaullt 20.
class Settings {
  late int _numberOfQuestions;
  late List<String> _selectedCategories = Themes.categories.listCategories
      .map((category) => category.name)
      .toList();
  late String _difficulty;
  late int _timePerQuestion;

  Settings(
      {int numberOfQuestions = 10,
      String difficulty = "medium",
      int timePerQuestion = 30}) {
    _numberOfQuestions = numberOfQuestions;
    _difficulty = difficulty;
    _timePerQuestion = timePerQuestion;
  }

  /// Returns number of questions.
  int get numberOfQuestions => _numberOfQuestions;

  /// Returns list of categorys.
  List<String> get categories => _selectedCategories;

  /// Returns the difficulty.
  String get difficulty => _difficulty;

  /// Returns time per question,
  int get timePerQuestion => _timePerQuestion;

  void setDifficulty(String newDifficulty) {
    _difficulty = newDifficulty;
  }
}
