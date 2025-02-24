import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isEmailValid = true;
  bool isPasswordValid = true;

  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    setState(() {
      isEmailValid = email.length >= 8;
      isPasswordValid = password.length >= 8;
    });

    if (!isEmailValid || !isPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email and password must be at least 8 characters!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Login Successful!"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/signup_confirmation');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F3797)),
                  ),
                  SizedBox(height: 40.h),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
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
                      prefixIcon: Icon(Icons.email, color: Color(0xFF6F3797)),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEEEEEE),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: isPasswordValid ? Colors.black : Colors.red,
                      ),
                      errorText: isPasswordValid
                          ? null
                          : "Must be at least 8 characters",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF6F3797)),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(color: Color(0xFF6F3797)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6F3797),
                      minimumSize: Size(290.w, 64.h),
                    ),
                    onPressed: _handleLogin,
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(color: Color(0xFF221F1F)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Create new account",
                          style: TextStyle(color: Color(0xFF6F3797)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text('_______ Or continue with _______'),
                  SizedBox(height: 20.h),
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
      ),
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF6F3797).withOpacity(0.1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(icon, size: 40.sp, color: Color(0xFF6F3797)),
          ),
        ),
      ),
    );
  }
}
