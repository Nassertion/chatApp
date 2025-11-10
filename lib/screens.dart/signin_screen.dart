import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/chat_screen.dart';
import 'package:flutter_application_1/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signinScreen extends StatefulWidget {
  const signinScreen({super.key});
  static String screenRoute = "signin_screen";

  @override
  State<signinScreen> createState() => _signinScreenState();
}

class _signinScreenState extends State<signinScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(height: 180, "./images/logo.png"),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,

                textAlign: TextAlign.center,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your Email",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),

                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  hintText: "Enter your password",
                ),
              ),
              SizedBox(height: 10),
              Mybutton(
                color: Colors.yellow[900]!,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  // print(password);
                  // print(email);
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    setState(() {
                      loading = false;
                    });
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                  } catch (e) {
                    print(e);
                  }
                },
                title: "Sign in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
