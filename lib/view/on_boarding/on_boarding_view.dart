import 'package:get/get.dart';
import 'widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_page_view.dart';
import 'widgets/custom_text_button.dart';
import '../../core/constants/app_colors.dart';
import 'widgets/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/datasource/static/on_boarding_data.dart';
import '../../controller/on_boarding_view_controllers/on_boarding_controller.dart';

class OnboardingView extends GetView<OnBoardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          CustomTextButton(onPressed: controller.skip, btnTitle: "Skip"),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 16,
            child: CustomPageView(
              next: controller.next,
              onPageChanged: controller.onPageChanged,
              pageController: controller.pageController,
            ),
          ),
          const Spacer(),
          const CustomSlider(),
          const Spacer(),
          GetBuilder<OnBoardingController>(
            builder: (controller) {
              return CustomElevatedButton(
                buttonTitle:
                    controller.currentPageIndex == onboardingData.length - 1
                        ? "Get Started\t\t>"
                        : "Continue\t\t>",
                onPressed: controller.next,
              );
            },
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
