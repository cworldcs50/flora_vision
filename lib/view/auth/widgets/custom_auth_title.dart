import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthTitle extends StatelessWidget {
  const CustomAuthTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.linear(1.0.sp),
      style: TextStyle(fontSize: 12.sp, color: AppColors.kPrimaryHeavyColor),
    );
  }
}
