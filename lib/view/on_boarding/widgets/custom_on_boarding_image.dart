import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({required this.imgPath, super.key});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.75.sw,
      height: 0.35.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 30.r,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(imgPath, fit: BoxFit.cover),
    );
  }
}
