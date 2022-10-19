import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/data/about.dart';
import 'package:template/theme/theme.dart';

class AboutView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Center(
      child: Consumer<About>(
        builder: (context, aboutData, child) => Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(style: Themes.textStyle.headline1, 'About'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: NavigationButton(
                      text: Text(
                        'About us',
                        textAlign: TextAlign.center,
                        style: Themes.textStyle.headline3,
                      ),
                      onPressed: () => aboutData.aboutCardCredits(),
                      width: 70,
                      height: 45,
                      color: Themes.colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: NavigationButton(
                      text: Text(
                        'Thanks to',
                        textAlign: TextAlign.center,
                        style: Themes.textStyle.headline3,
                      ),
                      onPressed: () => aboutData.aboutCardWill(),
                      width: 70,
                      height: 45,
                      color: Themes.colors.grey),
                )
              ],
            ),
            AboutCard(
                category: aboutData.category,
                headline: aboutData.headline,
                body: aboutData.body),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    ));
  }
}

class AboutCard extends StatelessWidget {
  Color backgroundColor = Themes.colors.white;

  late String _category;
  late String _headline;
  late String _body;

  AboutCard(
      {required String category,
      required String headline,
      required String body}) {
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
            Text(
                style: TextStyle(color: Themes.colors.greyDark, fontSize: 24),
                _headline),
            const Spacer(),
            Text(
                style: TextStyle(color: Themes.colors.greyDark, fontSize: 20),
                _body),
            const Spacer(),
          ])
        ],
      ),
    );
  }
}
