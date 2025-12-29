import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({
    required this.description,
    required this.textScaleFactor,
    super.key,
  });

  final String description;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      textScaler: TextScaler.linear(textScaleFactor),
      style: TextStyle(fontSize: 16.sp, color: AppColors.grey),
    );
  }
}
