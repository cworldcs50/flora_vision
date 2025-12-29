import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    required this.textInputType,
  });

  final bool obscureText;
  final String title, hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              title,
              textScaler: TextScaler.linear(1.0.sp),
              style: TextStyle(color: AppColors.black, fontSize: 12.sp),
            ),
          ],
        ),
        5.verticalSpace,
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r),
            ),
            hintStyle: TextStyle(color: AppColors.grey, fontSize: 14.sp),
            errorBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey, width: 2.w),
            ),
            contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: 8.h,
              horizontal: 10.w,
            ),
          ),
        ),
      ],
    );
  }
}
