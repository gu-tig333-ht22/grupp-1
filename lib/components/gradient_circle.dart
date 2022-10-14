import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

/// # NavigationButton
/// En knapp för
class GradientCircle extends StatelessWidget {
  var child;
  late Color color;
  late double size;
  GradientCircle(
      {this.child = null,
      required Color this.color,
      required double this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Themes.functions.lightenColor(color, 40),
                color,
                Themes.functions.darkenColor(color, 60)
              ],
              stops: [
                0,
                0.2,
                0.9,
              ])),
    );
  }
}
