import 'package:flutter/cupertino.dart';

import '../theme/theme.dart';

class About extends ChangeNotifier {
  late Color color;
  late String headline;
  late String body;
  late IconData iconData;

  About() {
    aboutCardCredits();
  }

  void aboutCardCredits() {
    headline = 'We who have made this app are:';
    body =
        'August Aublet\nLudwig Boström\nAndreas Fredriksson\nJosef Gunnarsson\nGustaf Hasselgren\nMårten Jonsson';
    iconData = Themes.icons.info;
    color = Themes.colors.greyDark;
    notifyListeners();
  }

  void aboutCardWill() {
    headline = 'Thanks!';
    body =
        'This project would not have been possible without Will Fry, who generously maintains and runs The Trivia API.';
    iconData = Themes.icons.favorite;
    color = Themes.colors.blueLight;
    notifyListeners();
  }

  void aboutCardApi() {
    headline = 'Info about Trivia-API';
    body =
        'This project would not have been possible without Will Fry, who generously maintains and runs The Trivia API.';
    iconData = Themes.icons.favorite;
    color = Themes.colors.greyDark;
    notifyListeners();
  }

  //String apiBody() {
  //}
}
