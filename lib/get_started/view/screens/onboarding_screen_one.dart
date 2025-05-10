import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 135.h),
          color: ColorManager.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/onboarding_screen_one.png',
                height: 329.58.h,
                width: 349.74.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.w, top: 43.h, right: 21.w),
                child: Text(
                  'Get advice only from a doctor you believe in.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(25.sp)),
                        height: 5.h,
                        width: 16.w,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.lightPurple,
                            borderRadius: BorderRadius.circular(25.sp)),
                        height: 5.h,
                        width: 16.w,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.onboardingTwo);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(52.w, 52.h),
                          shape: const CircleBorder(),
                          backgroundColor: ColorManager.primaryColor,
                        ),
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
