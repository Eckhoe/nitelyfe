import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/screens/logreg_screens/login_screen.dart';
import 'package:nitelyfe/screens/logreg_screens/registration_screen.dart';
import 'package:nitelyfe/utils/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 125),
              child: Container(
                child: Image.asset('images/nite_lyfe_3_welcome.png'),
              ),
            ),
            RoundButton(
              title: 'Login',
              color: kNiteLyfeRed,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
            ),
            RoundButton(
              title: 'Register',
              color: kNiteLyfeRed,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationScreen(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


