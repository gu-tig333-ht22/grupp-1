import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/data/about.dart';
import 'package:template/data/game_session.dart';
import 'package:template/data/highscore.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/about_view.dart';
import 'package:template/views/settings_view.dart';
import 'package:provider/provider.dart';

import 'highscore_view.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Fetching data for highscore at start.
    Provider.of<Highscore>(context, listen: false).fetchScores();
    return ScaffoldWithBackground(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(height: 50),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30),
                  child: IconButton(
                    icon: Icon(Icons.info_outline_rounded,
                        color: Themes.colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => AboutView(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero));
                    },
                  ),
                )
              ],
            ),
            Themes.textStyle.headlineGradient(text: 'Quizter', fontSize: 44),
            Themes.textStyle.headlineGradient(text: 'Pettersson', fontSize: 44),
            const Spacer(),
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
            NavigationButton(
              text: Text(
                "Highscore",
                style: Themes.textStyle.headline1,
              ),
              width: 250,
              height: 50,
              color: Themes.colors.blueDark,
              onPressed: () {
                Provider.of<Highscore>(context, listen: false)
                    .setShowPlayAgain(false);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => HighscoreView(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
