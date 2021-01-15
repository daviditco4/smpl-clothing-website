import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const brandYellow = Color(0xFFF1DC3A);
    const brandBlack = Color(0xFF121212);

    return MaterialApp(
      title: 'SMPL Wear',
      theme: ThemeData(
        primaryColor: brandYellow,
        shadowColor: brandBlack,
        fontFamily: 'Louis George Cafe',
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.125,
            letterSpacing: 0.45,
            color: brandYellow,
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 9.0,
            letterSpacing: 13.5,
            color: brandYellow,
          ),
          caption: TextStyle(
            fontSize: 9.375,
            letterSpacing: 0.45,
            color: brandYellow,
          ),
          overline: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 9.0,
            letterSpacing: 4.5,
            color: brandYellow,
          ),
        ),
        iconTheme: const IconThemeData(size: 16.0, color: brandYellow),
      ),
      routes: {'/': (_) => HomePage()},
    );
  }
}
