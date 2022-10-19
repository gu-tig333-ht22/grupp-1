import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings_view.dart';
import 'package:provider/provider.dart';

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
              text: Text(
                "Singleplayer",
                style: Themes.textStyle.headline1,
              ),
              width: 250,
              height: 50,
              color: Themes.colors.blueDark,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => SettingsView(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.4,
              child: NavigationButton(
                text: Text(
                  "Multiplayer",
                  style: Themes.textStyle.headline1,
                ),
                width: 250,
                height: 50,
                color: Themes.colors.blueDark,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Opacity(
              opacity: 0.4,
              child: NavigationButton(
                text: Text(
                  "Highscore",
                  style: Themes.textStyle.headline1,
                ),
                width: 250,
                height: 50,
                color: Themes.colors.blueDark,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
