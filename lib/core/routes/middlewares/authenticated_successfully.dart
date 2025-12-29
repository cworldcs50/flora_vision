import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../services/app_service.dart';
import '../../constants/app_routes_name.dart';
import '../../constants/caching_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedSuccessfully extends GetMiddleware {
  final SharedPreferences _sharedPreferences =
      Get.find<AppServices>().appSharedPrefs;

  @override
  RouteSettings? redirect(String? route) {
    if (_sharedPreferences.getBool(CachingKeysConstants.kAuthSuccess) == true) {
      return const RouteSettings(name: AppRoutesName.rGen);
    }

    return null;
  }
}
