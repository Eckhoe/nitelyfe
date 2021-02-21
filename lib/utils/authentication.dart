import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nitelyfe/screens/logreg_screens/login_screen.dart';
import 'navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  BuildContext context;
  final _auth = FirebaseAuth.instance;

  Authentication();

  Authentication.fromAuth(BuildContext context) {
    this.context = context;
  }

  void registerUser(String email, String password, String userName) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      newUser.user.updateProfile(displayName: userName);
      if (newUser != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigationBar()));
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
            context, MaterialPageRoute(builder: (context) => NavigationBar()));
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
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  getUserName() {
    return '@' + _auth.currentUser.displayName;
  }

  getEmail() {
    return _auth.currentUser.email;
  }
}
