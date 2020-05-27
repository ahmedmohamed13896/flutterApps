import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'pages/welcome_page.dart';

void main() async {
  /*Ensure that the welcome page has seen before using sharedPreferences package*/
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _pageView;
  if (seen == true && seen != null) {
    _pageView = HomePage();
  } else {
    _pageView = WelcomePage();
  }
  runApp(NewsApp(_pageView));
}

class NewsApp extends StatelessWidget {
  final Widget _screens;
  NewsApp(this._screens);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screens,
    );
  }
}
