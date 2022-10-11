import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

Container categorySelectionBox(
    {icon, required Color color, required double size}) {
  var themeIcons =
      ThemeIcons(); // Är det så det är tänkt att göra se rad 17 ich.
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          themeIcons.lightenColor(color, 40),
          color,
          themeIcons.darkenColor(color, 60)
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
          icon,
          color: Themes.colors.yellowLight, // vad skall det vara för färg?
        )),
      ),
    ),
  );
}
