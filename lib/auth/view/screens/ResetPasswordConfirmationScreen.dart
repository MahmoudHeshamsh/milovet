import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordConfirmationScreen extends StatefulWidget {
  const ResetPasswordConfirmationScreen({super.key});

  @override
  State<ResetPasswordConfirmationScreen> createState() =>
      _ResetPasswordConfirmationScreenState();
}

class _ResetPasswordConfirmationScreenState
    extends State<ResetPasswordConfirmationScreen> {
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
              Image.asset('assets/images/Frame 1261154868.png',
                  width: 264.w, height: 245.14.h),
              SizedBox(height: 20.h),
              Text(
                "Your Password has been Successfully Reset.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              const Text(
                "You can now log in to your account using your new password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6F3797),
                  minimumSize: Size(290.w, 64.h),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/doctor_user');
                },
                child: const Text("Let's go", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
