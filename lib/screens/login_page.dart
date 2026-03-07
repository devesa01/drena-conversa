import 'package:flutter/material.dart';
import 'widgets/custom_login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // UI elements and logic for login will go here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 0, 82),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
                SizedBox(height: 32),
              ],
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLoginInput(label: "Username"),
                  SizedBox(height: 16),
                  CustomLoginInput(label: "Password", obscureText: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
