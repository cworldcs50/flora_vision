import 'package:get/get.dart';
import '../../view/auth/sign_in.dart';
import '../../view/auth/sign_up.dart';
import '../../view/gen/gen_view.dart';
import '../../view/gen/live_view.dart';
import '../../view/logo/logo_view.dart';
import '../constants/app_routes_name.dart';
import 'middlewares/on_boarding_middleware.dart';
import 'middlewares/authenticated_successfully.dart';
import '../../view/on_boarding/on_boarding_view.dart';

final List<GetPage<dynamic>> appPages = [
  GetPage(
    name: AppRoutesName.rLogo,
    page: () => const LogoView(),
    middlewares: [OnBoardingMiddleware()],
  ),
  GetPage(
    name: AppRoutesName.rSignUp,
    page: () => const SignUpView(),
    middlewares: [AuthenticatedSuccessfully()],
  ),
  GetPage(name: AppRoutesName.rSignIn, page: () => const SignInView()),
  GetPage(name: AppRoutesName.rOnBoarding, page: () => const OnboardingView()),
  GetPage(name: AppRoutesName.rGen, page: () => const GenView()),
  GetPage(name: AppRoutesName.rLiveView, page: () => const LiveView()),
];
