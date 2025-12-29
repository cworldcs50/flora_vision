import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonTitle,
    required this.onPressed,
    super.key,
  });

  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        fixedSize: Size(280.w, 20.h),
        minimumSize: Size(50.w, 30.h),
        maximumSize: Size(300.w, 40.h),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: const Color(0XFFFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(fontSize: 14.sp),
        textScaler: TextScaler.linear(1.0.sp),
      ),
    );
  }
}
