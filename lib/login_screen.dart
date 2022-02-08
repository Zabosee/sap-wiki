import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FlutterLogo(size: 120),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey There,\nWelcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login to your Account to continue',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50)),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            onPressed: () {},
            label: Text('Sign Up with Google'),
          ),
          SizedBox(
            height: 48,
          ),
          RichText(
            text: TextSpan(
              text: 'Log in',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
