import 'package:get/get.dart';

import '../../core/constants/app_routes_name.dart';

class LogoViewController extends GetxController {
  bool isVisible = false;
  final Duration duration = const Duration(seconds: 2);

  @override
  Future<void> onInit() async {
    super.onInit();

    await Future.delayed(duration, () {
      isVisible = true;
      update();
    });
  }

  void oEnd() async => await Future.delayed(
    const Duration(seconds: 1),
    () => Get.offNamed(AppRoutesName.rOnBoarding),
  );
}
