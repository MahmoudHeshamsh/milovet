import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 182.h),
          color: ColorManager.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/get_started.png',
                height: 271.0.h,
                width: 364.0.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.w, top: 47.h, right: 21.w),
                child: Text(
                  'Welcome to MiloVet.',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.w, right: 21.w),
                child: Text(
                  'Get advice only from a doctor you believe in.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 107.0.h, right: 51.w, left: 51.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.doctorOrUSer);
                  },
                  child: Text(
                    'Get started',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.white,
                          fontSize: 18.0.sp,
                        ),
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
