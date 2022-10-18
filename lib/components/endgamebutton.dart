import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

import '../views/settings_view.dart';

class Endgame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartView()));
      },
      color: Themes.colors.red,
      textColor: Colors.white,
      child: Icon(
        Themes.icons.wrong,
        size: 24,
      ),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
  }
}
