import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Get your Code",
                style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F3797)),
              ),
              SizedBox(height: 10.h),
              Text(
                "Please enter the 4 digit code that we sent to your email address",
                style: TextStyle(fontSize: 13.sp, color: Colors.black),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(
                      width: 70.w,
                      height: 120.h,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF6F3797)),
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
              SizedBox(height: 20.h),
              Text(
                "Code expires in 30:00",
                style: TextStyle(fontSize: 16.sp, color: Color(0xff5B5353)),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6F3797),
                  minimumSize: Size(290.w, 64.h),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/reset_password');
                },
                child: Text("Verify", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffEEEEEE),
                  minimumSize: Size(290.w, 64.h),
                  side: BorderSide(color: Color(0xFF6F3797), width: 1.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/email_verification');
                },
                child: Text(
                  "Send again",
                  style: TextStyle(color: Color(0xFF6F3797)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
