import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isEmailValid = true;

  void _validateEmail() {
    setState(() {
      isEmailValid = _emailController.text.trim().length >= 8;
    });
  }

  void _resetPassword() {
    if (_emailController.text.trim().length < 8) {
      setState(() {
        isEmailValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email must be at least 8 characters!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isEmailValid = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Password reset link sent!"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/reset_password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Mail Address Here",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the email associated with your account",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => _validateEmail(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: isEmailValid ? Colors.black : Colors.red,
                  ),
                  errorText:
                      isEmailValid ? null : "Must be at least 8 characters",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                ),
                style:
                    TextStyle(color: isEmailValid ? Colors.black : Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(290, 64),
                ),
                onPressed: _resetPassword,
                child: Text("Reset Password",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
