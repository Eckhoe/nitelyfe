import 'package:flutter/material.dart';
import 'package:nitelyfe/utils/authentication.dart';
import 'package:nitelyfe/constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          width: 200,
          child: FloatingActionButton(
            child: Text(
              'Sign-Out',
              style: TextStyle(fontFamily: 'Comfortta', fontSize: 20),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: kNiteLyfeRed,
            elevation: 10,
            onPressed: () {
              Authentication _auth = new Authentication(context);
              _auth.logoutUser();
            },
          ),
        ),
      ),
    );
  }
}
