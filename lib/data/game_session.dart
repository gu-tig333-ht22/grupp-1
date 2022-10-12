// En spelomgång

// Spelets notifier

//
import 'package:template/data/question.dart';
import 'package:template/data/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/theme/theme.dart';
import 'package:provider/provider.dart';

class GameSession extends ChangeNotifier {
  Settings settings = Settings(
      numberOfQuestions: 10,
      selectedCategorys: [
        'Art & Literature',
        'General Knowledge',
        'Geography',
      ],
      difficylty: "medium",
      timePerQuestion: 10);

  List get chosenCategories => settings.categorys;

  void updateCategory(categoryName) {
    if (settings.categorys.contains(categoryName)) {
      settings.categorys.remove(categoryName);
    } else {
      settings.categorys.add(categoryName);
    }
    notifyListeners();
  }
}
