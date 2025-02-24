import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  String? _errorMessage;
  String? _successMessage;

  void _validateAndSubmit() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    setState(() {
      isPasswordValid = password.length >= 8;
      isConfirmPasswordValid = confirmPassword == password;
      _errorMessage = null;
      _successMessage = null;
    });

    if (!isPasswordValid) {
      setState(() {
        _errorMessage = "Password must be at least 8 characters!";
      });
      return;
    }
    if (!isConfirmPasswordValid) {
      setState(() {
        _errorMessage = "Passwords do not match!";
      });
      return;
    }

    setState(() {
      _successMessage = "Password reset successfully!";
    });

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/reset_password_confirmation');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Enter New Password",
                  style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              SizedBox(height: 20.h),

              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                onChanged: (_) => setState(() {
                  isPasswordValid = _passwordController.text.length >= 8;
                }),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffEEEEEE),
                  labelText: "New Password",
                  labelStyle: TextStyle(
                      color: isPasswordValid ? Colors.black : Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordValid ? Colors.green : Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordValid ? Colors.green : Colors.red,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.key, color: Colors.purple),
                ),
                style: TextStyle(
                    color: isPasswordValid ? Colors.black : Colors.red),
              ),
              SizedBox(height: 20.h),

              // Confirm Password Field
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                onChanged: (_) => setState(() {
                  isConfirmPasswordValid = _confirmPasswordController.text ==
                      _passwordController.text;
                }),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffEEEEEE),
                  labelText: "Confirm New Password",
                  labelStyle: TextStyle(
                      color:
                          isConfirmPasswordValid ? Colors.black : Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isConfirmPasswordValid ? Colors.green : Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isConfirmPasswordValid ? Colors.green : Colors.red,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.key, color: Colors.purple),
                ),
                style: TextStyle(
                    color: isConfirmPasswordValid ? Colors.black : Colors.red),
              ),
              SizedBox(height: 20.h),

              Row(
                children: [
                  const Icon(Icons.warning_amber_outlined, color: Colors.purple),
                  SizedBox(width: 8.w),
                  const Text('Must be at least 8 characters'),
                ],
              ),
              SizedBox(height: 20.h),

              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14.sp),
                    ),
                  ),
                ),
              if (_successMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      _successMessage!,
                      style: TextStyle(color: Colors.green, fontSize: 14.sp),
                    ),
                  ),
                ),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: Size(290.w, 64.h),
                  ),
                  onPressed: _validateAndSubmit,
                  child:
                      const Text("Continue", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
