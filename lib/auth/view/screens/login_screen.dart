import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/auth/view/screens/auth_view_model.dart';
import 'package:milovet/shared/color_manager.dart';

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

  // دالة التحقق من صحة الايميل
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    setState(() {
      isEmailValid = isValidEmail(email);
      isPasswordValid = password.length >= 8;
    });

    if (!isEmailValid || !isPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Please enter a valid email and password must be at least 8 characters!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login Successful!"),
        backgroundColor: Colors.green,
      ),
    );

    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    bool isPetOwner = args ?? true;
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/signup_confirmation');
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    bool isPetOwner = args ?? true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Login",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black),
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
                        color: const Color(0xFF6F3797)),
                  ),
                  SizedBox(height: 40.h),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEEEEEE),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: isEmailValid ? Colors.black : Colors.red,
                      ),
                      errorText:
                          isEmailValid ? null : "Please enter a valid email",
                      border: const OutlineInputBorder(),
                      prefixIcon:
                          const Icon(Icons.email, color: Color(0xFF6F3797)),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEEEEEE),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: isPasswordValid ? Colors.black : Colors.red,
                      ),
                      errorText: isPasswordValid
                          ? null
                          : "Password must be at least 8 characters",
                      border: const OutlineInputBorder(),
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFF6F3797)),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: const Text(
                        "Forgot your password?",
                        style: TextStyle(color: Color(0xFF6F3797)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6F3797),
                      minimumSize: Size(290.w, 64.h),
                    ),
                    onPressed: _handleLogin,
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(color: Color(0xFF221F1F)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/signup', arguments: isPetOwner);
                        },
                        child: const Text(
                          "Create new account",
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

  void login(
      dynamic emailController, dynamic passwordController, dynamic formKey) {
    if (formKey.currentState?.validate() == true) {
      BlocProvider.of<AuthViewModel>(context).login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
