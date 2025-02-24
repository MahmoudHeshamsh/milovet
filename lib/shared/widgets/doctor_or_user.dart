import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class DoctorOrUser extends StatelessWidget {
  DoctorOrUser({super.key});
  bool isPetOwner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 96.0.h, left: 17.w, right: 17.w),
                child: SizedBox(
                    width: 300.w,
                    height: 86.h,
                    child: Text(
                      'Are you a Doctor or a pet owner ?',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0.h, left: 17.w, right: 17.w),
                child: SizedBox(
                    width: 300.w,
                    height: 86.h,
                    child: Text(
                      'Please select your account type to continue and make use of the app is services.',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
              ),
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    minimumSize: Size(290.w, 64.h),
                  ),
                  onPressed: () {
                    isPetOwner = false;
                    Navigator.of(context).pushReplacementNamed(
                        Routes.login,
                        arguments: isPetOwner);
                  },
                  child: const Text("Veterinarian",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEEEEEE),
                    minimumSize: Size(290.w, 64.h),
                    side: BorderSide(
                        color: ColorManager.primaryColor, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        Routes.login,
                        arguments: isPetOwner);
                  },
                  child: const Text(
                    "Pet Owner",
                    style: TextStyle(color: ColorManager.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
