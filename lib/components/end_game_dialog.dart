import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/components/nav_button.dart';

import '../theme/theme.dart';
import '../views/start_view.dart';

class EndGameDialog extends StatelessWidget {
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(15),
        actionsPadding: const EdgeInsets.all(15),
        title: Text(
          'Are you sure you want to end the game?',
          style: TextStyle(color: Themes.colors.red),
        ),
        actions: [
          Row(
            children: [
              NavigationButton(
                  text: Text('End game', style: Themes.textStyle.headline3),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => StartView(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero),
                        ((route) => false));
                  },
                  width: 100,
                  height: 50,
                  color: Themes.colors.blueDark),
              const Spacer(),
              NavigationButton(
                  text: Text('Cancel', style: Themes.textStyle.headline3),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  width: 100,
                  height: 50,
                  color: Themes.colors.blueDark),
            ],
          )
        ]);
  }
}
