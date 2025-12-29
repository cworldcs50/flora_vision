import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/network/request_status.dart';
import '../../core/constants/app_durations.dart';
import '../../core/constants/app_routes_name.dart';
import '../../core/functions/cache_if_user_auth.dart';
import '../../core/classes/base_request_controller.dart';
import '../../data/datasource/remote/auth/sign_in_with_email_and_password.dart';

class SignInController extends BaseRequestController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailValidator(String? email) {
    if (email == null) {
      return "mandatory";
    }
    if (email.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(email)) {
      return "Invalid Email";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null) {
      return "mandatory";
    }
    if (password.isEmpty) {
      return "Enter Your Password";
    }

    return null;
  }

  Future<void> redirectTo() async => await Get.offNamed(AppRoutesName.rSignUp);

  Future<void> signIn() async {
    if (!await checkOnline()) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error!",
          message: "You are offline!",
          backgroundColor: Colors.red,
          duration: AppDurations.kSnackBarDuration,
        ),
      );
    }

    if (signInFormKey.currentState!.validate()) {
      setStatus(RequestStatus.loading);

      final result = await SignInWithEmailAndPassword()(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      result.fold(
        (error) {
          setStatus(RequestStatus.noData);
          Get.showSnackbar(
            GetSnackBar(
              title: error.title,
              message: error.message,
              backgroundColor: Colors.red,
              duration: AppDurations.kSnackBarDuration,
            ),
          );
        },
        (r) async {
          setStatus(RequestStatus.success);
          Get.showSnackbar(
            const GetSnackBar(
              title: "Success!",
              message: "Email Created Successfully!",
              backgroundColor: Colors.green,
              duration: AppDurations.kSnackBarDuration,
            ),
          );

          await cacheIfUserAuth(true);
          await Get.offAllNamed(AppRoutesName.rGen);
        },
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
