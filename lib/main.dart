import 'package:flutter/material.dart';
import 'screens/chat_screens/messages_screen.dart';
import 'screens/chat_screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MessagesScreen.id: (context) => MessagesScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
