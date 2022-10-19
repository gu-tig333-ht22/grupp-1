import 'package:flutter/cupertino.dart';

class About extends ChangeNotifier {
  String category = '';
  String headline = '';
  String body = '';

  About() {
    aboutCardCredits();
  }

  void aboutCardCredits() {
    category = 'Science';
    headline = 'We who have made this app are:';
    body =
        'August Aublet\nLudwig Boström\nAndreas Fredriksson\nJosef Gunnarsson\nGustaf Hasselgren\nMårten Jonsson';
    notifyListeners();
  }

  void aboutCardWill() {
    category = 'Arts & Literature';
    headline = 'Thanks!';
    body =
        'This project would not have been possible without Will Fry, who generously maintains and runs The Trivia API.';
    notifyListeners();
  }
}
