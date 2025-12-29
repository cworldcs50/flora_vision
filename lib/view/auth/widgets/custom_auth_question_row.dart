import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class CustomAuthQuestionRow extends StatelessWidget {
  const CustomAuthQuestionRow({
    super.key,
    required this.btnTitle,
    required this.question,
    required this.redirectTo,
  });

  final String question, btnTitle;
  final void Function() redirectTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          textScaler: TextScaler.linear(1.0.sp),
          style: const TextStyle(color: AppColors.grey),
        ),
        TextButton(
          onPressed: redirectTo,
          style: TextButton.styleFrom(foregroundColor: AppColors.kPrimaryColor),
          child: Text(btnTitle),
        ),
      ],
    );
  }
}
