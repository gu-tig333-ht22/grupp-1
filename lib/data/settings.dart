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
  late List<String> _selectedCategorys = []; //
  late String _difficulty;
  late int _timePerQuestion;

  /// # Settings
  ///
  /// If selectedCategory is all categorys
  /// set to empty list.
  Settings(
      {required int numberOfQuestions,
      required List<String> selectedCategorys,
      required String difficylty,
      required int timePerQuestion}) {
    _numberOfQuestions = numberOfQuestions;
    _selectedCategorys = selectedCategorys;
    _difficulty = difficylty;
    _timePerQuestion = timePerQuestion;
  }

  /// Returns number of questions.
  int get numberOfQuestions => _numberOfQuestions;

  /// Returns list of categorys.
  List<String> get categorys => _selectedCategorys;

  /// Returns the difficulty.
  String get difficulty => _difficulty;

  /// Returns time per question,
  int get timePerQuestion => _timePerQuestion;
}
