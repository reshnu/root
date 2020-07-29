import 'package:flutter/material.dart';
import 'package:flutterapp/ui/LoginPage1.dart';
import 'ui/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/verification.dart';
import 'ui/profilePage.dart';

import 'ui/character_details.dart';
import 'ui/skills.dart';

void main() {
  runApp(MyApp());
}

int checkIntroPage = 4;

Future checkFirstSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  checkIntroPage = prefs.getInt('1');
}

class MyApp extends StatelessWidget {
  final List<Widget> _homeScreen = [
    Intro(),
    LoginPage1(),
    VerificationPage(),
    MyHomePage(),
    Skills(),
    //AddPost(),
    Character()
  ];
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {},
      title: 'Film Fox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _homeScreen[checkIntroPage],
    );
  }
}
