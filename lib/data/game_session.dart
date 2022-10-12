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

  List get chosenCategories => settings.categories;

  void updateCategory(categoryName) {
    if (settings.categories.contains(categoryName)) {
      settings.categories.remove(categoryName);
    } else {
      settings.categories.add(categoryName);
    }
    notifyListeners();
  }
}
