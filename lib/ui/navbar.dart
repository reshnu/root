import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'homepage.dart';
import 'profilePage.dart';

// This class uses curved_navigation_bar Package
// Link to it :  https://pub.dev/packages/curved_navigation_bar

class BottomNavBar extends StatefulWidget {
  static const routeName = '/BottomNavBar';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final List<Widget> _childrean = [AppHomeScreen(), MyHomePage()];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.supervised_user_circle, size: 30, color: Colors.lightBlue),
          Icon(Icons.favorite_border, size: 30, color: Colors.lightBlue),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.lightBlue,
          ),
          Icon(Icons.notifications_active, size: 30, color: Colors.lightBlue),
          Icon(Icons.ac_unit, size: 30, color: Colors.lightBlue),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[100],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _childrean[_page],
    );
  }
}
