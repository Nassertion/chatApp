import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/register_screen.dart';
import 'package:flutter_application_1/screens.dart/signin_screen.dart';
import 'package:flutter_application_1/widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String screenRoute = "welcome_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(height: 180, "./images/logo.png"),
            Text(
              "MessageMe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                color: Color(0xff2e386b),
              ),
            ),
            SizedBox(height: 30),
            Mybutton(
              title: "sign in",
              onPressed: () {
                Navigator.pushNamed(context, signinScreen.screenRoute);
              },
              color: Colors.yellow[900]!,
            ),
            Mybutton(
              title: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.screenRoute);
              },
              color: Colors.blue[800]!,
            ),
          ],
        ),
      ),
    );
  }
}
