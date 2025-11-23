import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/button_widget.dart';

class AuthScreenTemplate extends StatelessWidget {
  final String title;
  final Color appBarColor;
  final Color buttonColor;
  final String buttonText;
  final bool loading;
  final Function(String email, String password) onSubmit;

  const AuthScreenTemplate({
    super.key,
    required this.title,
    required this.appBarColor,
    required this.buttonColor,
    required this.buttonText,
    required this.loading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarColor,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 180, "./images/logo.png"),
              const SizedBox(height: 20),

              // email
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
                textAlign: TextAlign.center,
                decoration: _inputStyle("Enter your Email"),
              ),

              const SizedBox(height: 10),

              // password
              TextField(
                obscureText: true,
                onChanged: (value) => password = value,
                textAlign: TextAlign.center,
                decoration: _inputStyle("Enter your Password"),
              ),

              const SizedBox(height: 10),

              Mybutton(
                color: buttonColor,
                title: buttonText,
                onPressed: () => onSubmit(email, password),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
