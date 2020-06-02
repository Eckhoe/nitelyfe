import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/screens/home_screen.dart';
import 'package:nitelyfe/screens/settings_screen.dart';

class CreateNavBar extends StatefulWidget {
  @override
  _CreateNavBarState createState() => _CreateNavBarState();
}

class _CreateNavBarState extends State<CreateNavBar> {
  int _currentIndex = 0; //gets the current index of the pages
  final List<Widget> _pages = [
    HomeScreen(),
    SettingsScreen(),
  ];//holds the screens which will be displayed with the nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 16, color: Colors.black),
          Icon(Icons.settings, size: 16, color: Colors.black),
        ],
        backgroundColor: kNiteLyfeRed,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.easeOut,
        height: 60,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
