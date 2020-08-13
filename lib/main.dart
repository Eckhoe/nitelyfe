import 'package:flutter/material.dart';
import 'package:nitelyfe/screens/logreg_screens/welcome_screen.dart';
import 'package:nitelyfe/utils/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

var email;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(home: email == null ? WelcomeScreen() : CreateNavBar());
  }
}
