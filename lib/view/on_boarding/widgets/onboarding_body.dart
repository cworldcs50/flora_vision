import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared_widgets/custom_description_text.dart';
import 'custom_on_boarding_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared_widgets/custom_title_text.dart';

class CustomOnBoardingBody extends StatelessWidget {
  const CustomOnBoardingBody({
    required this.title,
    required this.description,
    required this.next,
    required this.imgPath,
    super.key,
  });

  final void Function() next;
  final String title, description, imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: CustomOnBoardingImage(imgPath: imgPath)),
        25.verticalSpace,
        CustomTitle(title: title, textScaleFactor: 1.0.sp),
        12.verticalSpace,
        CustomDescription(description: description, textScaleFactor: 0.85.sp),
      ],
    );
  }
}
