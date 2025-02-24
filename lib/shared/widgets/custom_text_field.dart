import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/color_manager.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, 
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.borderBackgroundColor,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String? hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? borderBackgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscured,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: ColorManager.gray,
          fontSize: 14.0.sp
        ),
        contentPadding: EdgeInsets.only(left: 10.w),
        prefixIcon : prefixIcon,
        suffixIcon: const Icon(Icons.edit),
        suffixIconColor: ColorManager.primaryColor, 
        prefixIconColor: ColorManager.primaryColor,        
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: ColorManager.gray,
          fontSize: 14.0.sp
        ),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
          borderSide: BorderSide(color: ColorManager.primaryColor,
          width: 1.5.sp)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: ColorManager.primaryColor,
          width: 1.5.sp
          )
        )
      ),
    );
  }
}