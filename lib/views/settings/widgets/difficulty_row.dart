import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/custom_button.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';

class DifficultyRow extends StatelessWidget {
  const DifficultyRow({super.key});

  @override
  Widget build(BuildContext context) {
    String difficulty =
        Provider.of<GameSession>(context, listen: true).chosenDifficulty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _difficultyButton(
          context,
          "Easy",
          difficulty,
          Themes.colors.green,
        ),
        const SizedBox(width: 20),
        _difficultyButton(
          context,
          "Medium",
          difficulty,
          Themes.colors.yellow,
        ),
        const SizedBox(width: 20),
        _difficultyButton(
          context,
          "Hard",
          difficulty,
          Themes.colors.red,
        ),
      ],
    );
  }

  Widget _difficultyButton(
      context, String newDifficulty, String setDifficulty, color) {
    double opacity = 0.4;
    if (newDifficulty.toLowerCase() == setDifficulty) {
      opacity = 1;
    }
    return Opacity(
      opacity: opacity,
      child: CustomButton(
        text: Text(newDifficulty, style: Themes.textStyle.headline3),
        width: 80,
        height: 40,
        color: color,
        onPressed: () => Provider.of<GameSession>(context, listen: false)
            .updateDifficulty(newDifficulty.toLowerCase()),
      ),
    );
  }
}
