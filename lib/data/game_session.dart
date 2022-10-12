// En spelomgång

// Spelets notifier

//
import 'package:template/data/question.dart';
import 'package:template/data/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/theme/theme.dart';
import 'package:provider/provider.dart';

class GameSession extends ChangeNotifier {
  Settings settings = Settings();
  bool blured = false;

  List get chosenCategories => settings.categories;
  String get chosenDifficulty => settings.difficulty;

  void updateCategory(categoryName) {
    if (settings.categories.contains(categoryName)) {
      settings.categories.remove(categoryName);
    } else {
      settings.categories.add(categoryName);
    }
    notifyListeners();
  }

  void updateDifficulty(String newDifficulty) {
    settings.setDifficulty(newDifficulty);
    notifyListeners();
  }

  void setblured() {
    if (blured == true) {
      blured = false;
    } else {
      blured = true;
    }
    notifyListeners();
  }
}
