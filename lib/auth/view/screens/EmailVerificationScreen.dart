import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milovet/shared/color_manager.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Email Verification",
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
                "Get your Code",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(height: 10),
              Text(
                "Please enter the 4 digit code that we sent to your email address",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(
                      width: 70,
                      height: 120,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(4, (index) {
              //     return Container(
              //       width: 78,
              //       height: 100,
              //       margin: EdgeInsets.symmetric(horizontal: 5),
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.purple),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     );
              //   }),
              // ),
              SizedBox(height: 20),
              Text(
                "Code expires in 30:00",
                style: TextStyle(fontSize: 16, color: Color(0xff5B5353)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(290, 64),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/reset_password');
                },
                child: Text("Verify", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffEEEEEE),
                  minimumSize: Size(290, 64),
                  side: BorderSide(color: Colors.purple, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/email_verification');
                },
                child: Text(
                  "Send again",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
