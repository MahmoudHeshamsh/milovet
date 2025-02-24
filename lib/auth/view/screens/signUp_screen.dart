import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;

  void validateAndSignUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    setState(() {
      isEmailValid = email.length >= 8;
      isPasswordValid = password.length >= 8;
      isConfirmPasswordValid =
          confirmPassword == password && confirmPassword.isNotEmpty;
    });

    if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign Up Successful!"),
          backgroundColor: Colors.green,
        ),
      );
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    bool isPetOwner = args ?? true;
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed(Routes.congratulation,arguments: isPetOwner);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please correct the errors before proceeding"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6F3797)),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEEEEE),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: isEmailValid ? Colors.black : Colors.red),
                    errorText:
                        isEmailValid ? null : "Must be at least 8 characters",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email, color: Color(0xFF6F3797)),
                  ),
                  style: TextStyle(
                      color: isEmailValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEEEEE),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: isPasswordValid ? Colors.black : Colors.red),
                    errorText: isPasswordValid
                        ? null
                        : "Must be at least 8 characters",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF6F3797)),
                  ),
                  style: TextStyle(
                      color: isPasswordValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEEEEE),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        color:
                            isConfirmPasswordValid ? Colors.black : Colors.red),
                    errorText: isConfirmPasswordValid
                        ? null
                        : "Passwords do not match",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF6F3797)),
                  ),
                  style: TextStyle(
                      color:
                          isConfirmPasswordValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6F3797),
                    minimumSize: Size(290.w, 64.h),
                  ),
                  onPressed: validateAndSignUp,
                  child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "have you an account?",
                      style: TextStyle(color: Color(0xFF221F1F)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Color(0xFF6F3797)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                const Text('_______ Or continue with _______'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(Icons.g_mobiledata),
                    const SizedBox(width: 5),
                    _socialButton(Icons.facebook),
                    const SizedBox(width: 5),
                    _socialButton(Icons.apple),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF6F3797).withOpacity(0.1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 40.sp, color: const Color(0xFF6F3797)),
          ),
        ),
      ),
    );
  }
}
