import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings_view.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Themes.textStyle.headlineGradient(text: 'Quizter', fontSize: 44),
            Themes.textStyle.headlineGradient(text: 'Pettersson', fontSize: 44),
            Spacer(),
            NavigationButton(
              buttonText: "Single Player",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsView()));
              },
              isActive: true,
            ),
            SizedBox(height: 50),
            NavigationButton(
              buttonText: "Multiplayer",
              onPressed: () {},
              isActive: false,
            ),
            SizedBox(height: 50),
            NavigationButton(
              buttonText: "Highscore",
              onPressed: () {},
              isActive: false,
            ),
            SizedBox(height: 150)
          ],
        ),
      ),
    );
  }
}
