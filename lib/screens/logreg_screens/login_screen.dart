import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/utils/authentication.dart';
import 'package:nitelyfe/utils/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

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
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoraton.copyWith(hintText: 'ENTER YOUR EMAIL'),
            ),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextFieldDecoraton.copyWith(hintText: 'ENTER YOUR PASSWORD'),
            ),
            RoundButton(
              title: 'Login',
              color: kNiteLyfeRed,
              onPressed: () {
                Authentication _authentication = new Authentication(context);
                _authentication.loginUser(email, password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
