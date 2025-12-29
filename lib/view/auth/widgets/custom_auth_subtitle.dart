import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthSubtitle extends StatelessWidget {
  const CustomAuthSubtitle({required this.subtitle, super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textScaler: TextScaler.linear(1.0.sp),
      style: TextStyle(color: AppColors.grey, fontSize: 12.sp),
    );
  }
}
