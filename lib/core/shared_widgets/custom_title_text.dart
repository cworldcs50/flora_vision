import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    required this.title,
    required this.textScaleFactor,
    super.key,
  });

  final String title;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.linear(textScaleFactor),
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryHeavyColor,
      ),
    );
  }
}
