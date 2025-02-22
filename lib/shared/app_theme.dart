import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: ColorManager.primaryColor,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 25.0.sp,
              fontWeight: FontWeight.w700,
              color: ColorManager.black),
          titleSmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.black,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        iconColor: ColorManager.white,
        backgroundColor: ColorManager.primaryColor,
      )));
}
