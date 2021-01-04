import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:nitelyfe/screens/logreg_screens/welcome_screen.dart';
import 'package:nitelyfe/utils/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

var email;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  email = preferences.getString('email');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      theme: ThemeData(),
      home: email == null ? WelcomeScreen() : NavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
