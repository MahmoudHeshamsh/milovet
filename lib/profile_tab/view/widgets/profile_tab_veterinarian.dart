import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';
import 'package:milovet/shared/routes/routes.dart';

class ProfileTabVeterinarian extends StatelessWidget {
  const ProfileTabVeterinarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primaryColor),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/doctor_image.png'))),
          height: 120.h,
          width: 120.w,
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          child: Column(
            children: [
              Text(
                'DR: Mostafa Mohamed',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Mostafa Mohamed22 @gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.black),
              ),
              SizedBox(
                height: 50.h,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.sp)),
                    height: 45.h,
                    width: 330.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.editProfile);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: Image.asset(
                              'assets/images/edit_profile.png',
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Text(
                            'Edit My Profile',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.sp)),
                    height: 45.h,
                    width: 330.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          'assets/images/help_support.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Help & Support',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.sp)),
                    height: 45.h,
                    width: 330.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          'assets/images/notifications_icon.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Notifications',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.sp)),
                    height: 45.h,
                    width: 330.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          'assets/images/settings_icon.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Settings',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.sp)),
                    height: 45.h,
                    width: 330.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          'assets/images/logout.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Log out',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
