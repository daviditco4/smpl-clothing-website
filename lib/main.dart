import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const brandYellow = Color(0xFFF1DC3A);

    return MaterialApp(
      title: 'SMPL Wear',
      theme: ThemeData(
        primaryColor: brandYellow,
        fontFamily: 'Louis George Cafe',
      ),
      routes: {'/': (_) => HomePage()},
    );
  }
}
