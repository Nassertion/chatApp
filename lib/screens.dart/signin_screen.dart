import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/chat_screen.dart';
import 'package:flutter_application_1/widgets/auth_template_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static String screenRoute = "signin_screen";

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      title: "Sign in",
      appBarColor: Colors.yellow[900]!,
      buttonColor: Colors.yellow[900]!,
      buttonText: "Sign in",
      loading: loading,
      onSubmit: (email, password) async {
        setState(() => loading = true);

        try {
          await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.pushNamed(context, ChatScreen.screenRoute);
        } catch (e) {
          print(e);
        }

        setState(() => loading = false);
      },
    );
  }
}
