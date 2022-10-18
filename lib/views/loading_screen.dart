import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/question_view.dart';

class LoadingView extends StatefulWidget {
  late Navigator routeTo;

  LoadingView({required Navigator routeTo});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    super.initState();
    _navigateTo(widget.routeTo);
  }

  _navigateTo(routeTo) async {
    await Future.delayed(Duration(seconds: 2), () {});
    routeTo;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child:
          Center(child: Text("Get Ready", style: Themes.textStyle.headline1)),
    );
  }
}
