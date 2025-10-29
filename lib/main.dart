import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/chat_screen.dart';
import 'package:flutter_application_1/screens.dart/register_screen.dart';
import 'package:flutter_application_1/screens.dart/signin_screen.dart';
import 'package:flutter_application_1/screens.dart/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        RegisterScreen.screenRoute: (context) => RegisterScreen(),
        signinScreen.screenRoute: (context) => signinScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      },
    );
  }
}
