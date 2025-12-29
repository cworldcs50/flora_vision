import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../core/constants/app_durations.dart';
import '../../core/services/app_service.dart';
import '../../core/constants/app_routes_name.dart';
import '../../core/constants/caching_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasource/static/on_boarding_data.dart';

class OnBoardingController extends GetxController {
  int currentPageIndex = 0;
  late final PageController pageController;
  late final SharedPreferences _sharedPrefs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _sharedPrefs = Get.find<AppServices>().appSharedPrefs;
  }

  Future<void> skip() async {
    await _sharedPrefs.setBool(CachingKeysConstants.kVisited, true);
    await Get.offAllNamed(AppRoutesName.rSignUp);
  }

  Future<void> next() async {
    if (currentPageIndex == onboardingData.length - 1) {
      log("Current page index: $currentPageIndex");
      log("on boarding models length: ${onboardingData.length - 1}");
      await skip();
      return;
    }

    if (pageController.hasClients) {
      await pageController.animateToPage(
        currentPageIndex + 1,
        curve: Curves.easeInOutCubic,
        duration: AppDurations.kOnBoardingNavigationDuration,
      );
    }

    update();
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
