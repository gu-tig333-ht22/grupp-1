import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

import '../views/settings_view.dart';

class EndGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
                pageBuilder: (context, _, __) => SettingsView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero),
            ((route) => false));
      },
      color: Themes.colors.backgroundMiddle,
      textColor: Colors.white,
      padding: EdgeInsets.all(0),
      minWidth: 0,
      shape: CircleBorder(),
      child: Icon(
        Themes.icons.wrong,
        size: 24,
      ),
    );
  }
}
