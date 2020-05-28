import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
      },
    );
  }
}

