import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    bool isPetOwner = args ?? true;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bachgroundimage.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200.h,
            ),
            Image.asset(
              'assets/images/congrats.png',
              width: 264.w,
              height: 245.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'Your Password Has Been Successfully Reset.',
                style: TextStyle(
                    color: ColorManager.gray,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0.sp),
              ),
            ),
            Center(
              child: Text(
                'You can now log in to your account using your new password.',
                style: TextStyle(
                    color: ColorManager.gray,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0.sp),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.0.w),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        Routes.homeScreen,
                        arguments: isPetOwner);
                  },
                  child: SizedBox(
                    height: 64.h,
                    child: Center(
                      child: Text(
                        'Lets Go',
                        style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.white),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
