import 'package:get/get.dart';
import '../services/app_service.dart';
import '../constants/caching_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences sharedPrefs = Get.find<AppServices>().appSharedPrefs;

Future<void> cacheIfUserAuth(bool value) async =>
    await sharedPrefs.setBool(CachingKeysConstants.kAuthSuccess, value);
