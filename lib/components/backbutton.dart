import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

import '../views/settings_view.dart';

class BackToFirstViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
                pageBuilder: (context, _, __) => StartView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero),
            ((route) => false));
      },
      color: Colors.transparent,
      textColor: Themes.colors.white,
      padding: EdgeInsets.all(0),
      minWidth: 0,
      child: Icon(
        Themes.icons.backarrow,
        size: 24,
      ),
    );
  }
}
