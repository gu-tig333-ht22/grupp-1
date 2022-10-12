import 'package:template/views/settings_view.dart';

/// # Settings
/// Holds all parameters for a game.
///
/// int numberOfQuestions defaullt 10.
/// List<String> categorys defaullt [].
/// Stirng difficulty defaullt medium.
/// int timePerQuestion defaullt 20.
class Settings {
  late int _numberOfQuestions;
  late List<String> _selectedCategories = [
    'Art & Literature',
    'General Knowledge',
    'Geography',
  ]; //
  late String _difficulty;
  late int _timePerQuestion;

  Settings(
      {int numberOfQuestions = 10,
      String difficylty = "medium",
      int timePerQuestion = 30}) {
    _numberOfQuestions = numberOfQuestions;
    _difficulty = difficylty;
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
}
