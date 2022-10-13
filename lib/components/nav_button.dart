import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings_view.dart';

/// # NavigationButton
/// En knapp för
class NavigationButton extends StatelessWidget {
  late Widget text;
  late VoidCallback onPressed;
  late double width;
  late double height;
  late Color color;

  NavigationButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
  });

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color, Themes.icons.darkenColor(color, 40)],
            stops: const [
              0,
              0.9,
            ],
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: text,
        ),
      ),
    );
  }
}
