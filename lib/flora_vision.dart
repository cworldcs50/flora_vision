import 'app_binding.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloraVision extends StatelessWidget {
  const FloraVision({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) {
        return SafeArea(
          child: GetMaterialApp(
            getPages: appPages,
            initialBinding: AppBinding(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
