import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

/// Themes.category(name)
/// Returns the first category object with that name
/// Object.color returns Color of that category
/// Object.icon returns IconData of that category
/// Object.name returns String name of that category
class Themes {
  static ThemeColors colors = ThemeColors();

  static ThemeCategories categories = ThemeCategories();

  static ThemeCategory category(String name) {
    return categories.listCategories
        .where((category) => category.name == name)
        .first;
  }

  static ThemeData themeData = ThemeData(fontFamily: 'RobotoRegular');

  static ThemeTextStyles textStyle = ThemeTextStyles();

  static ThemeIcons icons = ThemeIcons();

  static ThemeFunctions functions = ThemeFunctions();
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
  final textGrey = Color(0xff3A3A3A);
  final white = Color(0xffEAEAEA);
  final backgroundMiddle = Color.fromARGB(240, 0, 41, 72);
  final backgroundDark = Color.fromARGB(240, 10, 29, 45);
  final backgroundLight = Color.fromARGB(240, 41, 130, 152);

  final greenLight = Color.fromARGB(255, 227, 255, 222);
  final green = Color(0xff83D775);
  final greenDark = Color(0xff102C0C);

  final redLight = Color.fromARGB(255, 255, 232, 232);
  final red = Color(0xffD64545);
  final redDark = Color(0xff391515);

  final yellowLight = Color(0xffE7C694);
  final yellow = Color(0xffD6B645);
  final yellowDark = Color(0xff392D15);

  final greyLight = Color(0xff9FA9B5);
  final grey = Color(0xff465E77);
  final greyDark = Color(0xff182837);

  final blueLight = Color(0xff4E9CBD);
  final blueDark = Color(0xff22566C);
}

class ThemeCategory {
  final String name;
  final Color color;
  final IconData icon;

  ThemeCategory({required this.name, required this.color, required this.icon});
}

class ThemeCategories {
  final List<ThemeCategory> listCategories = [
    ThemeCategory(
        name: 'Art & Literature',
        color: Themes.colors.artLiterature,
        icon: Icons.color_lens),
    ThemeCategory(
        name: 'Film & TV', color: Themes.colors.filmTv, icon: Icons.movie),
    ThemeCategory(
        name: 'Food & Drink',
        color: Themes.colors.foodDrink,
        icon: Icons.fastfood),
    ThemeCategory(
        name: 'General Knowledge',
        color: Themes.colors.generalKnowledge,
        icon: Icons.lightbulb),
    ThemeCategory(
        name: 'Geography', color: Themes.colors.geography, icon: Icons.public),
    ThemeCategory(
        name: 'History', color: Themes.colors.history, icon: Icons.music_note),
    ThemeCategory(
        name: 'Music', color: Themes.colors.music, icon: Icons.castle),
    ThemeCategory(
        name: 'Science', color: Themes.colors.science, icon: Icons.science),
    ThemeCategory(
        name: 'Society & Culture',
        color: Themes.colors.societyCulture,
        icon: Icons.account_balance),
    ThemeCategory(
        name: 'Sport & Leisure',
        color: Themes.colors.sportLeisure,
        icon: Icons.sports_soccer),
  ];
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
              fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Themes.colors.backgroundDark,
              Themes.colors.backgroundMiddle,
              Themes.colors.backgroundLight
            ])),
      ),
      child
    ]));
  }
}

class ThemeTextStyles {
  final TextStyle headline1 =
      TextStyle(fontSize: 30, color: Themes.colors.white);
  final TextStyle headline2 =
      TextStyle(fontSize: 20, color: Themes.colors.white);
  final TextStyle headline3 =
      TextStyle(fontSize: 15, color: Themes.colors.white);
  final TextStyle questionText =
      TextStyle(fontSize: 18, color: Themes.colors.textGrey);
  final TextStyle answerText =
      TextStyle(fontSize: 14, color: Themes.colors.textGrey);
  GradientText headlineGradient(
      {required String text, required double fontSize}) {
    return GradientText(
      text,
      style: TextStyle(fontSize: fontSize),
      colors: [
        Color(0xffD04DC3),
        Color(0xff7E4D9F),
        Color(0xff1D83C5),
        Color(0xff53DAF8),
        Color(0xff54BB77),
        Color(0xffA4CD63),
        Color(0xffDFE34E),
        Color(0xffFCB752),
        Color(0xffF47D55),
        Color.fromARGB(255, 240, 67, 73),
      ],
    );
  }
}

class ThemeIcons {
  final IconData correct = Icons.done;
  final IconData wrong = Icons.close;
  final IconData reset = Icons.manage_history;
}

class ThemeFunctions {
  Color darkenColor(Color color, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = 1 - percent / 100;
    return Color.fromARGB(color.alpha, (color.red * p).round(),
        (color.green * p).round(), (color.blue * p).round());
  }

  Color lightenColor(Color color, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        color.alpha,
        color.red + ((255 - color.red) * p).round(),
        color.green + ((255 - color.green) * p).round(),
        color.blue + ((255 - color.blue) * p).round());
  }
}
