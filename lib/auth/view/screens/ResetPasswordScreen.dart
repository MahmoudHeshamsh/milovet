import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // لإظهار رسالة خطأ

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _validateAndSubmit() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password.length < 8) {
      Fluttertoast.showToast(msg: "Password must be at least 8 characters!");
      return;
    }
    if (password != confirmPassword) {
      Fluttertoast.showToast(msg: "Passwords do not match!");
      return;
    }

    Navigator.pushNamed(context, '/reset_password_confirmation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "New Password",
                  labelStyle: TextStyle(color: Color(0xff626262)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Confirm New Password",
                  labelStyle: TextStyle(color: Color(0xff626262)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key, color: Colors.purple),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.warning_amber_outlined, color: Colors.purple),
                  SizedBox(width: 8),
                  Text('Must be at least 8 characters'),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: Size(290, 64),
                  ),
                  onPressed: _validateAndSubmit,
                  child:
                      Text("Continue", style: TextStyle(color: Colors.white)),
                ),
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

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Reset Password",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Enter New Password",
//                 style: TextStyle(
//                     fontSize: 27,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color(0xffEEEEEE),
//                   labelText: "New Password",
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
//                   labelText: "Confirm New Password",
//                   labelStyle: TextStyle(color: const Color(0xff626262)),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.key, color: Colors.purple),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   Icon(Icons.warning_amber_outlined, color: Colors.purple),
//                   SizedBox(width: 8),
//                   Text('Must be at least 8 characters'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   minimumSize: Size(290, 64),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/reset_password_confirmation');
//                 },
//                 child: Text("Continue", style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
