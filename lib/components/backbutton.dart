import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

import '../views/settings_view.dart';

class BackToFirstViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartView()));
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
