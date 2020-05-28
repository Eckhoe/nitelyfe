import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:nitelyfe/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RoundedButton(
          title: 'Login',
          color: kNiteLyfeRed,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color color;
  final Function onPressed;

  RoundedButton({this.title, this.color, this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: 4,
        color: color,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 225,
          height: 40,
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 24, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
