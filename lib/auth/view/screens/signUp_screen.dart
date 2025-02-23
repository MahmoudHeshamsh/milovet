import 'package:flutter/material.dart';
import 'package:milovet/shared/color_manager.dart';

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
      isEmailValid = email.isNotEmpty;
      isPasswordValid = password.isNotEmpty && password.length >= 8;
      isConfirmPasswordValid =
          confirmPassword.isNotEmpty && confirmPassword == password;
    });

    if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
      // إذا كان كل شيء صحيح، يتم الانتقال لصفحة التأكيد
      Navigator.pushNamed(context, '/signup_confirmation');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please correct the errors before proceeding")),
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
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: isEmailValid ? Color(0xff626262) : Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isEmailValid ? Colors.grey : Colors.red),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: isPasswordValid ? Color(0xff626262) : Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isPasswordValid ? Colors.grey : Colors.red),
                  ),
                  prefixIcon: Icon(Icons.key, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                      color: isConfirmPasswordValid
                          ? Color(0xff626262)
                          : Colors.red),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            isConfirmPasswordValid ? Colors.grey : Colors.red),
                  ),
                  prefixIcon: Icon(Icons.key, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(290, 64),
                ),
                onPressed: validateAndSignUp,
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:milovet/shared/color_manager.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         color: ColorManager.lightPurple,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Create Account",
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color(0xffEEEEEE),
//                   labelText: "Email",
//                   labelStyle: TextStyle(color: const Color(0xff626262)),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email, color: Colors.purple),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color(0xffEEEEEE),
//                   labelText: "Password",
//                   labelStyle: TextStyle(color: const Color(0xff626262)),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.key, color: Colors.purple),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color(0xffEEEEEE),
//                   labelText: "Confirm Password",
//                   labelStyle: TextStyle(color: const Color(0xff626262)),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.key, color: Colors.purple),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   minimumSize: Size(290, 64),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/signup_confirmation');
//                 },
//                 child: Text("Sign Up", style: TextStyle(color: Colors.white)),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Have an account already?"),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/login');
//                     },
//                     child: Text(
//                       "Sign in",
//                       style: TextStyle(color: Colors.purple),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text('_______ Or continue with _______'),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.purple.withOpacity(0.1),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(12),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(12),
//                         onTap: () {},
//                         child: Padding(
//                           padding: EdgeInsets.all(8),
//                           child: Icon(Icons.g_mobiledata,
//                               size: 40, color: Colors.purple),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.purple.withOpacity(0.1),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(12),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(12),
//                         onTap: () {},
//                         child: Padding(
//                           padding: EdgeInsets.all(8),
//                           child: Icon(Icons.facebook,
//                               size: 40, color: Colors.purple),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.purple.withOpacity(0.1),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(12),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(12),
//                         onTap: () {},
//                         child: Padding(
//                           padding: EdgeInsets.all(8),
//                           child:
//                               Icon(Icons.apple, size: 40, color: Colors.purple),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
