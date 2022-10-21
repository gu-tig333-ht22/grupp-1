import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

class DisplayCard extends StatelessWidget {
  Color backgroundColor = Themes.colors.white;

  late String _category;
  late Text _headline;
  late Text _body;

  DisplayCard(
      {required String category, required Text headline, required Text body}) {
    _category = category;
    _headline = headline;
    _body = body;
  }

  @override
  Widget build(BuildContext context) {
    Color categoryColor = Themes.category(_category).color;
    IconData categoryIcon = Themes.category(_category).icon;
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 18, right: 18),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(width: 10, color: categoryColor)),
      height: deviceHeight * 0.65,
      width: deviceWidth * 0.85,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryIcon,
                color: categoryColor.withOpacity(0.2),
                size: 120,
              ),
            ],
          ),
          Column(children: [
            _headline,
            const Spacer(),
            _body,
            const Spacer(),
          ])
        ],
      ),
    );
  }
}
