import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Stack(
        children: [Text("Get Ready", style: Themes.textStyle.headline1)],
      ),
    );
  }
}
