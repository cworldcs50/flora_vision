import 'package:get/get.dart';
import 'controller/gen_controllers/gen_controllers.dart';
import 'controller/auth_controllers/sign_in_controller.dart';
import 'controller/auth_controllers/sign_up_controller.dart';
import 'controller/gen_controllers/live_view_controller.dart';
import 'controller/logo_view_controllers/logo_view_controller.dart';
import 'controller/on_boarding_view_controllers/on_boarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoViewController());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => GenController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => LiveViewController(), fenix: true);
  }
}
