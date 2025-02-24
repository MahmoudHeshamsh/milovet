import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: ColorManager.primaryColor,
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: const AppBarTheme(      
        backgroundColor: ColorManager.primaryColor,
          foregroundColor: Colors.transparent,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 25.0.sp,
              fontWeight: FontWeight.w700,
              color: ColorManager.black),
          titleSmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.black,
          ),
          titleMedium: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            color: ColorManager.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.white
          ),
          bodyLarge: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.black
          )
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        iconColor: ColorManager.white,
        backgroundColor: ColorManager.primaryColor,
      )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.gray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      )
      );
}
