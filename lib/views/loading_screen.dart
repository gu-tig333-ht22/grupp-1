import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';

class LoadingView extends StatefulWidget {
  String countDown = "";

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() async {
    super.initState();
    _navigateTo();
  }

  _navigateTo() async {
    await Provider.of<GameSession>(context, listen: false).startGame();
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, _, __) => QuestionView(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero));
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Get Ready!", style: Themes.textStyle.headline1),
          Text(widget.countDown)
        ],
      ),
    );
  }
}
