import 'custom_auth_title.dart';
import 'custom_auth_subtitle.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'custom_auth_question_row.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthForm extends StatelessWidget {
  const CustomAuthForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.authBtn,
    required this.redirectTo,
    required this.authBtnTitle,
    required this.btnTitleAuthRow,
    required this.questionAuthRow,
    required this.emailController,
    required this.passwordController,
    required this.emailValidator,
    required this.passwordValidator,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final void Function() authBtn, redirectTo;
  final TextEditingController emailController, passwordController;
  final String? Function(String?) emailValidator, passwordValidator;
  final String title, subtitle, authBtnTitle, btnTitleAuthRow, questionAuthRow;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              15.verticalSpace,
              CustomAuthTitle(title: title),
              5.verticalSpace,
              CustomAuthSubtitle(subtitle: subtitle),
              20.verticalSpace,
              CustomTextFormField(
                title: "Email",
                validator: emailValidator,
                controller: emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              12.verticalSpace,
              CustomTextFormField(
                title: "Password",
                obscureText: true,
                validator: passwordValidator,
                hintText: "Enter your password",
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              15.verticalSpace,
              ElevatedButton(
                onPressed: authBtn,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  fixedSize: Size(300.w, 10.h),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.kPrimaryColor,
                ),
                child: Text(
                  authBtnTitle,
                  textScaler: TextScaler.linear(1.0.sp),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              15.verticalSpace,
              CustomAuthQuestionRow(
                redirectTo: redirectTo,
                btnTitle: btnTitleAuthRow,
                question: questionAuthRow,
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
