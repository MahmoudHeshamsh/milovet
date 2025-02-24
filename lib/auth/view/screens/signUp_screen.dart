import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SnackBar(
          content: Text("Sign Up Successful!"),
          backgroundColor: Colors.green,
        ),
      );

      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamed(context, '/signup_confirmation');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                      color: Colors.purple),
                ),
                SizedBox(height: 20.h),

                // Email Field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: isEmailValid ? Colors.black : Colors.red),
                    errorText:
                        isEmailValid ? null : "Must be at least 8 characters",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.purple),
                  ),
                  style: TextStyle(
                      color: isEmailValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: isPasswordValid ? Colors.black : Colors.red),
                    errorText: isPasswordValid
                        ? null
                        : "Must be at least 8 characters",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.purple),
                  ),
                  style: TextStyle(
                      color: isPasswordValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),

                // Confirm Password Field
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        color:
                            isConfirmPasswordValid ? Colors.black : Colors.red),
                    errorText: isConfirmPasswordValid
                        ? null
                        : "Passwords do not match",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.purple),
                  ),
                  style: TextStyle(
                      color:
                          isConfirmPasswordValid ? Colors.black : Colors.red),
                ),
                SizedBox(height: 20.h),

                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: Size(290.w, 64.h),
                  ),
                  onPressed: validateAndSignUp,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),

                SizedBox(height: 10.h),

                // Signup Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("have you an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                Text('_______ Or continue with _______'),
                SizedBox(height: 20.h),

                // Social Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(Icons.g_mobiledata),
                    SizedBox(width: 5),
                    _socialButton(Icons.facebook),
                    SizedBox(width: 5),
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
        color: Colors.purple.withOpacity(0.1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(icon, size: 40.sp, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
