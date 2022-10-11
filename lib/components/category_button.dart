import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

InkWell categorySelectionBox(category) {
  List tempValdaKategorier = [
    'Art & Literature',
    'General Knowledge',
    'Geography',
  ];
  var themeIcons = ThemeIcons(); // Är det så det är tänkt att
  // göra se rad 17 ich.
  Color categoryColor = category.color;

  if (!tempValdaKategorier.contains(category.name)) {
    categoryColor =
        Themes.colors.greyLight; // skall vara någon form av filter i stället
  }
  return InkWell(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            themeIcons.lightenColor(categoryColor, 40),
            categoryColor,
            themeIcons.darkenColor(categoryColor, 60)
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
            color: Themes.colors.yellowLight, // vad skall det vara för färg?
          )),
        ),
      ),
    ),
    onTap: () {
      // update provider and redraw
    },
  );
}
