import 'package:flutter/material.dart';
import 'package:template/components/custom_button.dart';
import 'package:template/data/highscore.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/about_view.dart';
import 'package:template/views/settings_view.dart';
import 'package:provider/provider.dart';

import 'highscore_view.dart';

// Startskärm med knappar för singleplayer och highscore. Multiplayer är ej implemnterad än

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Center(
        child: Column(
          children: [
            _aboutIconRow(context),
            HeadlineText(text: 'Quizter', fontSize: 44),
            HeadlineText(text: 'Pettersson', fontSize: 44),
            const Spacer(),
            _button(
                context,
                'Singleplayer',
                (
                  context,
                  a,
                  b,
                ) =>
                    SettingsView()),
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.4,
              child: MultiPlayerButton(),
            ),
            const SizedBox(height: 20),
            HighscoreButton(),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Widget _aboutIconRow(context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          icon: Icon(Icons.info_outline_rounded, color: Themes.colors.white),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, _, __) => AboutView(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero),
            );
          },
        ),
      ],
    );
  }

  Widget _button(BuildContext context, String text,
      Widget Function(BuildContext, Animation, Animation) createView) {
    return CustomButton(
      text: Text(
        text,
        style: Themes.textStyle.headline1,
      ),
      width: 250,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: createView,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero));
      },
    );
  }
}

class HighscoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: Text(
        "Highscore",
        style: Themes.textStyle.headline1,
      ),
      width: 250,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) =>
                  HighscoreView(showPlayAgain: false),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero),
        );
      },
    );
  }
}

class MultiPlayerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: Text(
        "Multiplayer",
        style: Themes.textStyle.headline1,
      ),
      width: 250,
      height: 50,
      color: Themes.colors.blueDark,
      onPressed: () {},
    );
  }
}

class InformationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info_outline_rounded, color: Themes.colors.white),
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, _, __) => AboutView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero));
      },
    );
  }
}
