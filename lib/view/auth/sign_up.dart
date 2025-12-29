import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_auth_form.dart';
import '../../core/constants/app_colors.dart';
import '../../core/classes/request_handler.dart';
import '../../core/constants/app_img_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/auth_controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Obx(() {
        return Center(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: RequestHandlerView(
                  onRetry: controller.onRetry,
                  status: controller.requestStatus.value,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImgConstants.kLogo,
                          height: 0.22.sh,
                          width: 1.0.sw,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: CustomAuthForm(
                            formKey: controller.signUpFormKey,
                            authBtnTitle: "Sign Up",
                            title: "Create Account",
                            btnTitleAuthRow: "Sign in",
                            authBtn: controller.signUp,
                            redirectTo: controller.redirectTo,
                            emailValidator: controller.emailValidator,
                            questionAuthRow: "Already have an account?",
                            emailController: controller.emailController,
                            passwordValidator: controller.passwordValidator,
                            passwordController: controller.passwordController,
                            subtitle:
                                "Sign up to start identifying flower diseases",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
