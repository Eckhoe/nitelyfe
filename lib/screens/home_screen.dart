import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Image.asset('images/nite_lyfe_3.png',
            height: 50, width: 100, fit: BoxFit.scaleDown),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: FlatButton(
              splashColor: Colors.transparent,
              child: Icon(Icons.chat), // or Send Icon
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                //TODO 1: open the messages screen
              },
            ),
            width: 60,
          ),
        ],
      ),
      body: Center(
        child: Text('hello world'),
      ),
    );
  }
}
