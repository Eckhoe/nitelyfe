import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nitelyfe/screens/logreg_screens/welcome_screen.dart';
import 'package:nitelyfe/utils/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  BuildContext context;
  final _auth = FirebaseAuth.instance;

  Authentication(BuildContext context) {
    this.context = context;
  }

  void registerUser(String email, String password) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CreateNavBar()));
      }
    } catch (e) {
      print(e);
    }
  }

  void loginUser(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CreateNavBar()));
      }
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() async {
    _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
