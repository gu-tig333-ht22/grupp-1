import 'package:flutter/material.dart';
import 'package:template/views/settings_view.dart';
import 'package:template/views/start_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsView(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
