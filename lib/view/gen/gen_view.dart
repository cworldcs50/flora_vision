import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_img_constants.dart';
import '../../core/shared_widgets/custom_title_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/gen_controllers/gen_controllers.dart';
import '../../core/shared_widgets/custom_description_text.dart';

class GenView extends GetView<GenController> {
  const GenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(AppImgConstants.kLogo, width: 100.w, height: 100.h),
        actions: [
          TextButton.icon(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout, color: AppColors.grey),
            label: const Text(
              'Logout',
              style: TextStyle(color: AppColors.grey),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            20.verticalSpace,
            CustomTitle(
              title: "Plant Disease Detection",
              textScaleFactor: 0.70.sp,
            ),
            10.verticalSpace,
            CustomDescription(
              textScaleFactor: 0.67.sp,
              description:
                  "Use your camera to detect plant diseases instantly with AI",
            ),
            30.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                15.verticalSpace,
                ElevatedButton.icon(
                  onPressed:
                      () async => await Get.bottomSheet(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // IconButton(
                            //   onPressed: controller.pickFromCamera,
                            //   icon: const Icon(Icons.camera_alt_outlined),
                            // ),
                            // const SizedBox(width: 40),
                            IconButton(
                              onPressed: controller.pickFromGallery,
                              icon: const Icon(Icons.image_outlined),
                            ),
                          ],
                        ),
                        backgroundColor: AppColors.kBackgroundColor,
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: const BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    fixedSize: Size(260.w, 45.h),
                  ),
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Take Photo",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Capture a single image",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  icon: Icon(
                    size: 13.sp,
                    color: Colors.white,
                    Icons.camera_alt_outlined,
                  ),
                ),
                15.verticalSpace,
                //   ElevatedButton.icon(
                //     onPressed: controller.liveVideo,
                //     style: ElevatedButton.styleFrom(
                //       alignment: Alignment.center,
                //       backgroundColor: Colors.white,
                //       fixedSize: Size(260.w, 45.h),
                //       overlayColor: AppColors.kPrimaryColor.withAlpha(100),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.r),
                //         side: const BorderSide(color: AppColors.kPrimaryColor),
                //       ),
                //     ),
                //     label: const Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           "Real-time Camera",
                //           style: TextStyle(
                //             color: AppColors.kPrimaryColor,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Text(
                //           "Live camera preview",
                //           style: TextStyle(
                //             color: AppColors.kPrimaryColor,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //     icon: Icon(
                //       Icons.videocam_outlined,
                //       color: AppColors.kPrimaryColor,
                //       size: 15.sp,
                //     ),
                //   ),
              ],
            ),
            50.verticalSpace,
            Obx(
              () => Text(
                controller.title.value,
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
            20.verticalSpace,
            Obx(
              () => Text(
                controller.label.value,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Obx(
              () => Text(
                controller.confidence.value == 0.0
                    ? ""
                    : "${(controller.confidence.value * 100).toStringAsFixed(2)}%",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
