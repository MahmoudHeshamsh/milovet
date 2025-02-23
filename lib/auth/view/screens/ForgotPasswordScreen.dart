import 'package:flutter/material.dart';
import 'package:milovet/shared/color_manager.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              // Text(
              //   "Enter the email assosiated with your account",
              //   style: TextStyle(fontSize: 13, color: Colors.black),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the email associated with your account",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),

              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Email",
                  labelStyle: TextStyle(color: const Color(0xff626262)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(290, 64),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/email_verification');
                },
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
