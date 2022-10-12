import 'package:flutter/material.dart';
import 'package:template/data/game_session.dart';
import 'package:template/theme/theme.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  var category;
  CategoryButton(this.category, {super.key});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    List tempValdaKategorier =
        Provider.of<GameSession>(context, listen: true).chosenCategories;

    Color categoryColor = category.color;
    Color iconColor = Themes.colors.whiteBackground;
    double opacity = 1;
    if (!tempValdaKategorier.contains(category.name)) {
      categoryColor = Themes.icons.lightenColor(categoryColor, 40);
      opacity = 0.40;
    }
    return InkWell(
      child: Opacity(
        opacity: opacity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Themes.icons.lightenColor(categoryColor, 40),
                categoryColor,
                Themes.icons.darkenColor(categoryColor, 60)
              ],
              stops: const [
                0,
                0.2,
                0.9,
              ],
            ),
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Center(
                  child: Icon(
                category.icon,
                color: iconColor, // vad skall det vara för färg?
              )),
            ),
          ),
        ),
      ),
      onTap: () {
        Provider.of<GameSession>(context, listen: false)
            .updateCategory(category.name);
      },
    );
  }
}
