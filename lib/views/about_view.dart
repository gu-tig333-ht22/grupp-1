import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/displayCard.dart';
import 'package:template/components/nav_button.dart';
import 'package:template/data/about.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

class AboutView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Center(
      child: Consumer<About>(
        builder: (context, aboutData, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(Themes.icons.backarrow,
                            color: Themes.colors.white),
                        onPressed: () => Navigator.of(context)
                            .pushAndRemoveUntil(
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) =>
                                        StartView(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero),
                                ((route) => false))),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                              style: Themes.textStyle.headline1, 'About'))),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
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
                      width: 100,
                      height: 45,
                      color: Themes.colors.blueDark),
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
                      width: 100,
                      height: 45,
                      color: Themes.colors.blueDark),
                )
              ],
            ),
            DisplayCard(
                iconData: aboutData.iconData,
                color: aboutData.color,
                headline: Text(
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Themes.colors.greyDark, fontSize: 24),
                    aboutData.headline),
                body: Text(
                    style:
                        TextStyle(color: Themes.colors.greyDark, fontSize: 20),
                    aboutData.body)),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    ));
  }
}
