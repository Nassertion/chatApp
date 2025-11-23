import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/chat_screen.dart';
import 'package:flutter_application_1/widgets/auth_template_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String screenRoute = "register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      title: "Register",
      appBarColor: Colors.blue[800]!,
      buttonColor: Colors.blue[800]!,
      buttonText: "Register",
      loading: loading,
      onSubmit: (email, password) async {
        setState(() => loading = true);

        try {
          await _auth.createUserWithEmailAndPassword(
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
