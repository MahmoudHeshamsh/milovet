import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpConfirmationScreen extends StatefulWidget {
  const SignUpConfirmationScreen({super.key});

  @override
  State<SignUpConfirmationScreen> createState() =>
      _SignUpConfirmationScreenState();
}

class _SignUpConfirmationScreenState extends State<SignUpConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 100, color: Colors.purple),
              SizedBox(height: 20),
              Text(
                "Congratulations",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: "Welcome to "),
                    TextSpan(
                      text: "Milovet",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, '/reset_password_confirmation');
                        },
                    ),
                    TextSpan(
                        text:
                            ", your trusted partner in keeping your furry friend happy and healthy!"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
