import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shirts/shirts.dart';
import 'pages/about/about_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/shirt_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const brandYellow = Color(0xFFF1DC3A);
    const brandBlack = Color(0xFF121212);
    final btnShape = MaterialStateProperty.all(const RoundedRectangleBorder());

    return ChangeNotifierProvider(
      create: (_) => Shirts(),
      child: MaterialApp(
        title: 'SMPL Wear',
        theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          colorScheme: const ColorScheme.dark(
            primary: brandYellow,
            primaryVariant: brandYellow,
            error: Color(0xFFEC1C24),
          ),
          accentColor: brandYellow,
          canvasColor: Colors.white,
          disabledColor: Colors.black54,
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
            bodyText2: TextStyle(
              fontSize: 9.375,
              letterSpacing: 0.45,
              color: brandYellow,
            ),
            caption: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 9.45,
              letterSpacing: 4.5,
              color: brandYellow,
            ),
            overline: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8.5,
              letterSpacing: 1.8,
              color: brandYellow,
            ),
            button: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.6,
              color: brandYellow,
            ),
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 39.0,
              letterSpacing: 1.8,
              color: brandYellow,
            ),
            bodyText1: TextStyle(fontSize: 13.66, color: brandYellow),
          ),
          primaryTextTheme: const TextTheme(
            subtitle1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.2,
              letterSpacing: 0.675,
              color: Colors.black,
            ),
            caption: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 8.6,
              letterSpacing: 0.675,
              color: Colors.black,
            ),
            subtitle2: TextStyle(fontSize: 11.25),
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.9,
              color: Colors.black,
            ),
            button: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.1,
              letterSpacing: 1.8,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15.6,
              color: Colors.black,
            ),
            overline: TextStyle(fontSize: 7.05, letterSpacing: 1.8),
          ),
          iconTheme: const IconThemeData(color: brandYellow),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(120.0, 30.0)),
              shape: btnShape,
              backgroundColor: MaterialStateProperty.all(brandBlack),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              shape: btnShape,
              side: MaterialStateProperty.all(
                const BorderSide(color: brandBlack),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size.square(32.0)),
            ),
          ),
        ),
        routes: {
          '/': (_) => HomePage(),
          ShirtDetailsPage.routeName: (_) => ShirtDetailsPage(),
          AboutPage.routeName: (_) => AboutPage(),
        },
      ),
    );
  }
}
