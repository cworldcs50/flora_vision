import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_img_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/logo_view_controllers/logo_view_controller.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: GetBuilder<LogoViewController>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                AnimatedOpacity(
                  opacity: controller.isVisible ? 1.0 : 0.0,
                  onEnd: controller.oEnd,
                  duration: controller.duration,
                  child: Image.asset(
                    AppImgConstants.kLogo,
                    width: 600.w,
                    height: 600.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
