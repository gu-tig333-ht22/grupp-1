import 'package:flutter/material.dart';

class Themes {
  static Map<String, ThemeCategory> categories = ThemeCategories().categories;
  static List<String> listCategories = ThemeCategories().listCategories;
  static ThemeColors colors = ThemeColors();
}

class ThemeColors {
  // Färger för varje kategori
  final Color artLiterature = const Color(0xff1D83C5);
  final Color filmTv = const Color(0xffF04349);
  final Color foodDrink = const Color(0xffFCB752);
  final Color generalKnowledge = const Color(0xffF47D55);
  final Color geography = const Color(0xffA4CD63);
  final Color history = const Color(0xff7E4D9F);
  final Color music = const Color(0xff54BB77);
  final Color science = const Color(0xffDFE34E);
  final Color societyCulture = const Color(0xff53DAF8);
  final Color sportLeisure = const Color(0xffD04DC3);

  // Övriga färger
  final questionColor = Color(0xff3A3A3A);
  final white = Color(0xffEAEAEA);
  final backgroundDark = Color.fromARGB(249, 0, 16, 28);
  final backgrounkdMiddle = Color.fromARGB(248, 0, 41, 72);
  final backgroundLight = Color.fromARGB(250, 41, 130, 152);

  final correctanswerLight = Color(0xffD9FFD2);
  final correctanswerGreen = Color(0xff83D775);
  final correctanswerDark = Color(0xff102C0C);

  final wronganswerLight = Color(0xffE79494);
  final wronganswerRed = Color(0xffD64545);
  final wronganswerDark = Color(0xff391515);

  final totalLight = Color(0xff9FA9B5);
  final total = Color(0xff465E77);
  final totalDark = Color(0xff182837);

  final difficultyEasy = Color(0xff659C3A);
  final difficultyMedium = Color(0xff9C6F3A);
  final difficultyHard = Color(0xff9C3A3A);

  final lightBlue = Color(0xff4E9CBD);
  final darkBlue = Color(0xff22566C);

  final slidercircleDark = Color(0xff22566C);
  final slidercirleLight = Color(0xff465E77);

  final correctBackground = Color(0xff83D775);
  final incorrectbackground = Color(0xffD64545);
}

class ThemeCategory {
  final String name;
  final Color color;
  final IconData icon;

  ThemeCategory({required this.name, required this.color, required this.icon});
}

class ThemeCategories {
  final List<String> listCategories = [
    'Art & Literature',
    'Film & TV',
    'Food & Drink',
    'General Knowledge',
    'Geography',
    'History',
    'Music',
    'Science',
    'Society & Culture',
    'Sport & Leisure'
  ];
  final Map<String, ThemeCategory> categories = {
    'Art & Literature': ThemeCategory(
        name: 'Art & Literature',
        color: Themes.colors.artLiterature,
        icon: Icons.color_lens),
    'Film & TV': ThemeCategory(
        name: 'Film & TV', color: Themes.colors.filmTv, icon: Icons.movie),
    'Food & Drink': ThemeCategory(
        name: 'Food & Drink',
        color: Themes.colors.foodDrink,
        icon: Icons.fastfood),
    'General Knowledge': ThemeCategory(
        name: 'General Knowledge',
        color: Themes.colors.generalKnowledge,
        icon: Icons.lightbulb),
    'Geography': ThemeCategory(
        name: 'Geography', color: Themes.colors.geography, icon: Icons.public),
    'History': ThemeCategory(
        name: 'History', color: Themes.colors.history, icon: Icons.music_note),
    'Music': ThemeCategory(
        name: 'Music', color: Themes.colors.music, icon: Icons.castle),
    'Science': ThemeCategory(
        name: 'Science', color: Themes.colors.science, icon: Icons.science),
    'Society & Culture': ThemeCategory(
        name: 'Society & Culture',
        color: Themes.colors.societyCulture,
        icon: Icons.account_balance),
    'Sport & Leisure': ThemeCategory(
        name: 'Sport & Leisure',
        color: Themes.colors.sportLeisure,
        icon: Icons.sports_soccer),
  };
}

class ScaffoldWithBackground extends StatelessWidget {
  final Widget child;

  ScaffoldWithBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroundimage.jpg'),
                fit: BoxFit.cover)),
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Themes.colors.backgroundDark,
              Themes.colors.backgrounkdMiddle,
              Themes.colors.backgroundLight
            ])),
      ),
      child
    ]));
  }
}
