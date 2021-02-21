import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/utils/authentication.dart';
import 'package:nitelyfe/utils/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String userName;

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
              onChanged: (value) {
                userName = value;
              },
              decoration:
                  kTextFieldDecoraton.copyWith(hintText: 'ENTER YOUR USERNAME'),
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
              title: 'Register',
              color: kNiteLyfeRed,
              onPressed: () {
                Authentication _authentication =
                    new Authentication.fromAuth(context);
                _authentication.registerUser(email, password, userName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
