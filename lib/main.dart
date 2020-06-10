import 'package:flutter/material.dart';
import 'package:nitelyfe/screens/logreg_screens/welcome_screen.dart';
import 'package:nitelyfe/utils/navbar.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen()
      /*  THIS IS THE IF STATEMENT THAT MUST BE MADE
      
        if the user logged in has set 'remember me' on their device,
        go straight to the 'CreateNavBar'

        otherwise if the user doesnt have 'remember me' set, or is a first
        time user, bring to login_screen and have the do the registration and
        logging in
        
      */
    );
  }
}

