import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings_view.dart';

/// # NavigationButton
/// En knapp för
class NavigationButton extends StatelessWidget {
  late String _buttonText;
  late VoidCallback _onPressed;
  late bool _isActive;

  NavigationButton({
    required String buttonText,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    _buttonText = buttonText;
    _isActive = isActive;
    _onPressed = onPressed;
  }

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    Color color = Themes.colors.blueLight;
    double opacity = 1;

    if (!_isActive) {
      opacity = 0.4;
    }

    return Center(
      child: Opacity(
        opacity: opacity,
        child: Container(
          height: 50,
          width: 250,
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
            onPressed: _onPressed,
            child: Text(
              _buttonText,
              style:
                  TextStyle(color: Themes.colors.whiteBackground, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
